//
//  GetCharactersUseCase.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

protocol GetCharactersUseCase {
    func execute() async -> UseCaseResult<[Character]>
}
