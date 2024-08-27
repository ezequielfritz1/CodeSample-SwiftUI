//
//  CharacterDTO.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

struct CharacterDTO: Decodable {
    let id: Int
    let name: String
    let image: String?
    let status: CharacterStatusDTO?
    let episode: [String]
}
