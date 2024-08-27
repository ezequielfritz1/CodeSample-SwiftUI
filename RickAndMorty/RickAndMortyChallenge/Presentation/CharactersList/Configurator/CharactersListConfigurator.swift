//
//  CharactersListConfigurator.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

final class CharactersListConfigurator {
    @MainActor static func configCharactersListView() -> CharactersListView {
        let viewModel = CharactersListViewModel()
        return CharactersListView(viewModel: viewModel)
    }
}
