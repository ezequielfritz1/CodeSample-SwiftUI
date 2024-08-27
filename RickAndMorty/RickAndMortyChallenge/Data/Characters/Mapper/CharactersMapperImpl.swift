//
//  CharactersMapperImpl.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

final class CharactersMapperImpl: CharactersMapper {
    func dataToDomain(_ data: [CharacterDTO]) -> [Character] {
        data.map {
            .init(id: $0.id, name: $0.name, image: $0.image, status: mapStatus($0.status), episodes: $0.episode)
        }
    }

    private func mapStatus(_ status: CharacterStatusDTO?) -> CharacterStatus? {
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
