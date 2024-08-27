//
//  GetEpisodesUseCase.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

protocol GetEpisodesUseCase {
    func execute(request: GetEpisodesRequest) async -> UseCaseResult<[Episode]>
}
