//
//  EpisodesMapperImpl.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

final class EpisodesMapperImpl: EpisodesMapper {
    func dataToDomain(_ data: [EpisodeDTO]) -> [Episode] {
        data.map {
            .init(id: $0.id, name: $0.name, episode: $0.episode, airDate: $0.airDate, characters: $0.characters)
        }
    }
}
