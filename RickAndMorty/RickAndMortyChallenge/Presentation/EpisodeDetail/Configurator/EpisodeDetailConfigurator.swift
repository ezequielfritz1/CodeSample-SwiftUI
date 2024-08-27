//
//  EpisodeDetailConfigurator.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

final class EpisodeDetailConfigurator {
    @MainActor static func configEpisodeDetail(episode: UiEpisode) -> EpisodeDetailView {
        let viewModel = EpisodeDetailViewModel(episode: episode)
        return EpisodeDetailView(viewModel: viewModel)
    }
}
