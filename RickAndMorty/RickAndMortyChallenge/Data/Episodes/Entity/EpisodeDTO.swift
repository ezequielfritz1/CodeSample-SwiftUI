//
//  EpisodeDTO.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

struct EpisodeDTO: Decodable {
    let id: Int
    let name: String
    let episode: String
    let airDate: String
    let characters: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case episode
        case airDate = "air_date"
        case characters
    }
}
