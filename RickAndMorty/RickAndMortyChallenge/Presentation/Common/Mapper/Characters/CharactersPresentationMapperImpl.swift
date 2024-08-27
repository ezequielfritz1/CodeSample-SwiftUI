//
//  CharactersPresentationMapperImpl.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

final class CharactersPresentationMapperImpl: CharactersPresentationMapper {
    func domainToPresentation(_ data: [Character]) -> [UiCharacter] {
        data.map {
            .init(id: $0.id, name: $0.name, image: $0.image, status: mapStatus($0.status), episodes: $0.episodes)
        }
    }

    private func mapStatus(_ status: CharacterStatus?) -> UiCharacterStatus? {
        guard let status else { return nil }
        switch status {
        case .alive:
            return .alive
        case .dead:
            return .dead
        case .unknown:
            return .unknown
        }
    }
}
