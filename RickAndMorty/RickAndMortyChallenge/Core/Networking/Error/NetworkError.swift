//
//  NetworkError.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

enum NetworkError: Error {
    case invalidUrl
    case decoding
    case request(String)
    case unknown
}
