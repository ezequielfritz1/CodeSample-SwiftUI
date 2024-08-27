//
//  NetworkManager.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

protocol NetworkManager {
    func request<T: Decodable>(endpoint: String) async throws -> T
}
