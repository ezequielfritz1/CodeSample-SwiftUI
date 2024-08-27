//
//  NetworkManagerImpl.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

import Foundation

final class NetworkManagerImpl: NetworkManager {
    private let session: URLSession
    private let decoder: JSONDecoder

    private static let successStatusCodes = 200..<299

    init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
        self.session = session
        self.decoder = decoder
    }

    func request<T: Decodable>(endpoint: String) async throws -> T {
        guard let url = URL(string: ServerConstants.baseUrl + endpoint) else {
            throw NetworkError.invalidUrl
        }

        let (data, response) = try await session.data(from: url)

        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, Self.successStatusCodes ~= statusCode else {
            let error: NetworkErrorMessage = try decodeJSONData(data: data)
            throw NetworkError.request(error.error)
        }

        return try decodeJSONData(data: data)
    }

    private func decodeJSONData<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decoding
        }
    }
}
