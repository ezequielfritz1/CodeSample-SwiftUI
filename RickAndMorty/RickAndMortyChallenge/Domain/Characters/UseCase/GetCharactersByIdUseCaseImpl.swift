//
//  GetCharactersByIdUseCaseImpl.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

final class GetCharactersByIdUseCaseImpl: GetCharactersByIdUseCase {
    private let service: CharactersService

    init(service: CharactersService = CharactersServiceImpl()) {
        self.service = service
    }

    func execute(request: GetCharactersRequest) async -> UseCaseResult<[Character]> {
        do {
            let characters = try await service.getCharactersById(request: request)
            return .success(characters)
        } catch {
            return .failure(error)
        }
    }
}
