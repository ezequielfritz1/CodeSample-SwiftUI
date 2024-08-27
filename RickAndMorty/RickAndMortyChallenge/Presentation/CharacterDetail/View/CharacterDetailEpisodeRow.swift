//
//  CharacterDetailEpisodeRow.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 11/5/23.
//

import SwiftUI

struct CharacterDetailEpisodeRow: View {
    // MARK: - Public Properties
    let episode: UiEpisode

    // MARK: - Body
    var body: some View {
        HStack(spacing: 12) {
            Text(episode.episode)
                .foregroundColor(.gray)
                .fontWeight(.medium)
                .font(.caption)

            Text(episode.name)
                .foregroundColor(.black)
                .fontWeight(.medium)
                .font(.footnote)
                .lineLimit(1)

            Spacer()
        }
        .padding(.init(top: 0, leading: 12, bottom: 0, trailing: 12))
    }
}

struct CharacterDetailEpisodeRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailEpisodeRow(
            episode: .init(
                id: 1,
                name: "Close Rick-counters of the Rick Kind",
                episode: "S01E10",
                airDate: "April 7, 2014",
                characters: []
            )
        )
    }
}
