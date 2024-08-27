//
//  CharacterStatusDTO.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

enum CharacterStatusDTO: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}
