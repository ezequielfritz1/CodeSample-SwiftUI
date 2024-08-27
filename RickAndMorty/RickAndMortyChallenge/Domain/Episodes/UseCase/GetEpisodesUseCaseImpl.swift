//
//  GetEpisodesUseCaseImpl.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

final class GetEpisodesUseCaseImpl: GetEpisodesUseCase {
    private let service: EpisodesService

    init(service: EpisodesService = EpisodesServiceImpl()) {
        self.service = service
    }

    func execute(request: GetEpisodesRequest) async -> UseCaseResult<[Episode]> {
        do {
            let response = try await service.getEpisodes(request: request)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
