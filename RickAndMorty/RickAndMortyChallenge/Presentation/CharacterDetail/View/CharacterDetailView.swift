//
//  CharacterDetailView.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

import SwiftUI

struct CharacterDetailView: View {
    // MARK: - Public Properties
    @StateObject var viewModel: CharacterDetailViewModel

    // MARK: - Body
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                characterImage

                LazyVStack(alignment: .leading, spacing: 0) {
                    characterInformationView

                    if !viewModel.episodes.isEmpty {
                        episodesListView
                    }

                    Spacer()
                }
                .ignoresSafeArea()
            }
        }
        .navigationDestination(for: UiEpisode.self) { episode in
            EpisodeDetailConfigurator.configEpisodeDetail(episode: episode)
        }
        .onError(error: $viewModel.error)
        .task {
            await viewModel.onAppear()
        }
    }

    // MARK: - Character Information View
    private var characterInformationView: some View {
        HStack {
            characterNameView
            Spacer()
            characterStatusView
        }
        .padding(8)
    }

    // MARK: - Character Status View
    private var characterStatusView: some View {
        Text(viewModel.character.status?.rawValue ?? "")
            .foregroundColor(.black)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.init(top: 2, leading: 8, bottom: 2, trailing: 8))
            .background(viewModel.character.status?.color)
            .cornerRadius(8)
            .padding(.trailing, 16)
    }

    // MARK: - Character Name View
    private var characterNameView: some View {
        Text(viewModel.character.name)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.black)
    }

    // MARK: - Character Image
    private var characterImage: some View {
        AsyncImage(url: URL(string: viewModel.character.image ?? "")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(height: 300)
        .cornerRadius(4)
    }

    // MARK: - Episodes List View
    @ViewBuilder
    private var episodesListView: some View {
        LazyVStack(alignment: .leading, spacing: 4) {
            Text("Episodes")
                .padding(.leading, 16)
                .fontWeight(.medium)
                .foregroundColor(.black)
                .font(.callout)
                .padding(.bottom, 12)

            ForEach(Array(viewModel.episodes.keys.sorted()), id: \.self) { season in
                Section(
                    header: Text(season)
                        .fontWeight(.heavy)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.leading, 12)
                ) {
                    LazyVStack {
                        ForEach(viewModel.episodes[season] ?? []) { episode in
                            NavigationLink(value: episode) {
                                CharacterDetailEpisodeRow(episode: episode)
                                    .padding(6)
                            }
                        }
                    }
                    .background(.gray.opacity(0.4))
                    .cornerRadius(8)
                    .padding(.bottom, 12)
                }
            }
            .padding(.leading, 12)
            .padding(.trailing, 12)
        }
        .padding(8)
        .background(.gray.opacity(0.1))
        .cornerRadius(16)
        .padding(12)

    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(
            viewModel: .init(
                character: .init(
                    id: 1,
                    name: "test",
                    image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                    status: .alive,
                    episodes: ["https://rickandmortyapi.com/api/episode/10", "https://rickandmortyapi.com/api/episode/11", "https://rickandmortyapi.com/api/episode/12"]
                )
            )
        )
    }
}
