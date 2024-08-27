//
//  CharactersListViewModel.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

import Foundation

@MainActor
final class CharactersListViewModel: ObservableObject {
    // MARK: - Private Properties
    private let getCharactersUseCase: GetCharactersUseCase
    private let mapper: CharactersPresentationMapper
    private var remoteCharacters: [UiCharacter] = [] {
        didSet {
            characters = remoteCharacters
        }
    }

    // MARK: - Public Properties
    @Published var characters: [UiCharacter] = []
    @Published var error: UiError?

    // MARK: - Initializer
    init(
        getCharactersUseCase: GetCharactersUseCase = GetCharactersUseCaseImpl(),
        mapper: CharactersPresentationMapper = CharactersPresentationMapperImpl()
    ) {
        self.getCharactersUseCase = getCharactersUseCase
        self.mapper = mapper
    }

    // MARK: - Public Methods
    func onAppear() async {
        let result = await getCharactersUseCase.execute()
        switch result {
        case .success(let characters):
            self.remoteCharacters = mapper.domainToPresentation(characters)
        case .failure(let error):
            self.error = mapper.mapError(error)
        }
    }

    func onSearch(_ query: String) {
        guard !query.isEmpty else {
            return characters = remoteCharacters
        }
        let queriedCharacters = characters.filter { $0.name.contains(query) }
        characters = queriedCharacters
    }
}
