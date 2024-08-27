//
//  CharactersMapper.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

protocol CharactersMapper {
    func dataToDomain(_ data: [CharacterDTO]) -> [Character]
}
