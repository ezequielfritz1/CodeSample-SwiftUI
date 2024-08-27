//
//  UiError.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

import Foundation

enum UiError: LocalizedError {
    case invalidUrl
    case decoding
    case network(String)
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid Url"
        case .decoding:
            return "Decoding error"
        case .network(let error):
            return error
        case .unknown:
            return "Unknown error"
        }
    }
}
