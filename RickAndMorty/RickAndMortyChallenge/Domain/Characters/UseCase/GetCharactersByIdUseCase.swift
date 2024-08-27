//
//  GetCharactersByIdUseCase.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

protocol GetCharactersByIdUseCase {
    func execute(request: GetCharactersRequest) async -> UseCaseResult<[Character]>
}
