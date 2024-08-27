//
//  UseCaseResult.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

enum UseCaseResult<T> {
    case success(T)
    case failure(Error)
}
