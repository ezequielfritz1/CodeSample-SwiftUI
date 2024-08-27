//
//  PresentationMapper.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

protocol PresentationMapper {
    func mapError(_ error: Error) -> UiError
}

extension PresentationMapper {
    func mapError(_ error: Error) -> UiError {
        guard let error = error as? NetworkError else { return .unknown }
        switch error {
        case .invalidUrl:
            return .invalidUrl
        case .decoding:
            return .decoding
        case .request(let error):
            return .network(error)
        case .unknown:
            return .unknown
        }
    }
}
