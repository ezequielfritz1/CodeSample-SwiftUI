//
//  EpisodesPresentationMapper.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

protocol EpisodesPresentationMapper: PresentationMapper {
    func domainToPresentation(_ data: [Episode]) -> [UiEpisode]
}
