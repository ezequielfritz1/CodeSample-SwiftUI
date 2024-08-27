//
//  ServerConstants.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

struct ServerConstants {
    // MARK: - URLs
    static let baseUrl = "https://rickandmortyapi.com/api/"

    // MARK: - Endpoints
    struct Endpoints {
        static let characters = "character"
        static let episode = "episode/%@"
    }
}
