//
//  EpisodeDetailView.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

import SwiftUI

struct EpisodeDetailView: View {
    // MARK: - Public Properties
    @StateObject var viewModel: EpisodeDetailViewModel

    // MARK: - Body
    var body: some View {
        VStack(spacing: 8) {
            Text(viewModel.episode.name)
                .foregroundColor(.black)
                .fontWeight(.heavy)
                .font(.title)

            Text(viewModel.episode.episode)
                .foregroundColor(.gray)
                .fontWeight(.medium)
                .font(.subheadline)

            Text(viewModel.episode.airDate)
                .foregroundColor(.gray.opacity(0.8))
                .fontWeight(.regular)
                .font(.subheadline)

            charactersListView
        }
        .task {
            await viewModel.onAppear()
        }
        .onError(error: $viewModel.error)
    }

    // MARK: - Characters List View
    private var charactersListView: some View {
        List {
            Section(header: Text("Characters")) {
                ForEach(viewModel.characters) { character in
                    NavigationLink(value: character) {
                        CharacterRow(character: character)
                    }
                }
            }
        }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(
            viewModel: .init(
                episode: .init(
                    id: 1,
                    name: "The Ricklantis Mixup",
                    episode: "S03E07",
                    airDate: "September 10, 2017",
                    characters: ["https://rickandmortyapi.com/api/character/1", "https://rickandmortyapi.com/api/character/2"]
                )
            )
        )
    }
}
