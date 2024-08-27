//
//  CharacterDetailConfigurator.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

final class CharacterDetailConfigurator {
    @MainActor static func configCharacterDetail(character: UiCharacter) -> CharacterDetailView {
        let viewModel = CharacterDetailViewModel(character: character)
        return CharacterDetailView(viewModel: viewModel)
    }
}
