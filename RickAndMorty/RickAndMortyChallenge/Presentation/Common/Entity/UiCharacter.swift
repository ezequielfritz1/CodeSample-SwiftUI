//
//  UiCharacter.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

struct UiCharacter: Equatable, Identifiable, Hashable {
    let id: Int
    let name: String
    let image: String?
    let status: UiCharacterStatus?
    let episodes: [String]
}
