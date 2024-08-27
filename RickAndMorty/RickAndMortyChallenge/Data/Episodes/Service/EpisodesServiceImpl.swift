//
//  EpisodesServiceImpl.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

final class EpisodesServiceImpl: EpisodesService {
    private let networkManager: NetworkManager
    private let mapper: EpisodesMapper

    init(
        networkManager: NetworkManager = NetworkManagerImpl(),
        mapper: EpisodesMapper = EpisodesMapperImpl()
    ) {
        self.networkManager = networkManager
        self.mapper = mapper
    }

    func getEpisodes(request: GetEpisodesRequest) async throws -> [Episode] {
        let episodesIds = request.ids.map { String($0) }.joined(separator: ",")
        let endpoint = String(format: ServerConstants.Endpoints.episode, episodesIds)
        if request.ids.count == 1 {
            let result: EpisodeDTO = try await networkManager.request(endpoint: endpoint)
            return mapper.dataToDomain([result])
        } else {
            return mapper.dataToDomain(try await networkManager.request(endpoint: endpoint))
        }
    }
}
