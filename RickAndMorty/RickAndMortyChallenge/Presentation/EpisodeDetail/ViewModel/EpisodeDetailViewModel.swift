//
//  EpisodeDetailViewModel.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

import Foundation

@MainActor
final class EpisodeDetailViewModel: ObservableObject {
    // MARK: - Private Properties
    private let getCharactersByIdUseCase: GetCharactersByIdUseCase
    private let mapper: CharactersPresentationMapper

    // MARK: - Public Properties
    let episode: UiEpisode
    @Published var characters: [UiCharacter] = []
    @Published var error: UiError?

    // MARK: - Initializer
    init(
        episode: UiEpisode,
        getCharactersByIdUseCase: GetCharactersByIdUseCase = GetCharactersByIdUseCaseImpl(),
        mapper: CharactersPresentationMapper = CharactersPresentationMapperImpl()
    ) {
        self.episode = episode
        self.getCharactersByIdUseCase = getCharactersByIdUseCase
        self.mapper = mapper
    }

    // MARK: - Public Methods
    func onAppear() async {
        let result = await getCharactersByIdUseCase.execute(request: .init(ids: getCharactersIds()))
        switch result {
        case .success(let characters):
            self.characters = mapper.domainToPresentation(characters)
        case .failure(let error):
            self.error = mapper.mapError(error)
        }
    }

    // MARK: - Private Methods
    private func getCharactersIds() -> [Int] {
        episode.characters.compactMap {
            let path = URLComponents(string: $0)?.path
            let paths = path?.components(separatedBy: "/")
            return Int(paths?.last ?? "")
        }
    }
}
