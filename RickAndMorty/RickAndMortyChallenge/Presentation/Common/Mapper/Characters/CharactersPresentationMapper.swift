//
//  CharactersPresentationMapper.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

protocol CharactersPresentationMapper: PresentationMapper {
    func domainToPresentation(_ data: [Character]) -> [UiCharacter]
}
