//
//  EpisodesMapper.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

protocol EpisodesMapper {
    func dataToDomain(_ data: [EpisodeDTO]) -> [Episode]
}
