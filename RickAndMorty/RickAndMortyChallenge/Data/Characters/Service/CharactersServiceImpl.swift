//
//  CharactersServiceImpl.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

final class CharactersServiceImpl: CharactersService {
    private let networkManager: NetworkManager
    private let mapper: CharactersMapper

    init(
        networkManager: NetworkManager = NetworkManagerImpl(),
        mapper: CharactersMapper = CharactersMapperImpl()
    ) {
        self.networkManager = networkManager
        self.mapper = mapper
    }

    func getAllCharacters() async throws -> [Character] {
        let charactersList: CharactersListDTO = try await networkManager.request(
            endpoint: ServerConstants.Endpoints.characters
        )
        return mapper.dataToDomain(charactersList.results)
    }

    func getCharactersById(request: GetCharactersRequest) async throws -> [Character] {
        let charactersIds = request.ids.map { String($0) }.joined(separator: ",")
        let endpoint = ServerConstants.Endpoints.characters + "/" + charactersIds
        return mapper.dataToDomain(try await networkManager.request(endpoint: endpoint))
    }
}
