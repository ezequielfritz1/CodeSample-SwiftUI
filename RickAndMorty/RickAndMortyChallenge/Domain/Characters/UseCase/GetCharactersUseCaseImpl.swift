//
//  GetCharactersUseCaseImpl.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

final class GetCharactersUseCaseImpl: GetCharactersUseCase {
    private let service: CharactersService

    init(service: CharactersService = CharactersServiceImpl()) {
        self.service = service
    }

    func execute() async -> UseCaseResult<[Character]> {
        do {
            return .success(try await service.getAllCharacters())
        } catch {
            return .failure(error)
        }
    }
}
