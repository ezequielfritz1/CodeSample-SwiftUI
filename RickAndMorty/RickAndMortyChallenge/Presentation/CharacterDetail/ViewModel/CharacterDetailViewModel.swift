//
//  CharacterDetailViewModel.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

import Foundation

@MainActor
final class CharacterDetailViewModel: ObservableObject {
    // MARK: - Private Properties
    private let getEpisodesUseCase: GetEpisodesUseCase
    private let mapper: EpisodesPresentationMapper

    // MARK: - Public Properties
    let character: UiCharacter
    @Published var episodes: [String: [UiEpisode]] = [:]
    @Published var error: UiError?

    // MARK: - Initializer
    init(
        character: UiCharacter,
        getEpisodesUseCase: GetEpisodesUseCase = GetEpisodesUseCaseImpl(),
        mapper: EpisodesPresentationMapper = EpisodesPresentationMapperImpl()
    ) {
        self.character = character
        self.getEpisodesUseCase = getEpisodesUseCase
        self.mapper = mapper
    }

    // MARK: - Public Methods
    func onAppear() async {
        let result = await getEpisodesUseCase.execute(request: .init(ids: getEpisodesIds()))
        switch result {
        case .success(let episodes):
            self.episodes = groupEpisodes(mapper.domainToPresentation(episodes))
        case .failure(let error):
            self.error = mapper.mapError(error)
        }
    }

    // MARK: - Private Methods
    private func getEpisodesIds() -> [Int] {
        character.episodes.compactMap {
            let path = URLComponents(string: $0)?.path
            let paths = path?.components(separatedBy: "/")
            return Int(paths?.last ?? "")
        }
    }

    private func groupEpisodes(_ episodes: [UiEpisode]) -> [String: [UiEpisode]] {
        episodes.reduce(into: [String: [UiEpisode]]()) { result, episode in
            let season = String(episode.episode.prefix(3))
            result[season, default: []].append(episode)
        }
    }
}
