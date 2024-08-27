//
//  UiEpisode.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

struct UiEpisode: Equatable, Identifiable, Hashable {
    let id: Int
    let name: String
    let episode: String
    let airDate: String
    let characters: [String]
}
