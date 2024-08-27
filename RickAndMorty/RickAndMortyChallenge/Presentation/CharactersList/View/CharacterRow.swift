//
//  CharacterRow.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

import SwiftUI

struct CharacterRow: View {
    // MARK: - Public Properties
    let character: UiCharacter

    // MARK: - Body
    var body: some View {
        HStack(spacing: 12) {
            characterAvatar

            Text(character.name)
                .font(.body)
                .foregroundColor(.black)

            Spacer()

            if let status = character.status {
                characterStatusView(status)
            }
        }
        .padding(12)
    }

    // MARK: - Character Avatar
    private var characterAvatar: some View {
        AsyncImage(url: URL(string: character.image ?? "")) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 48, height: 48)
        .cornerRadius(16)
    }

    // MARK: - Character Status View
    private func characterStatusView(_ status: UiCharacterStatus) -> some View {
        HStack(spacing: 6) {
            Circle()
                .fill(status.color)
                .frame(width: 8, height: 8)
            Text(status.rawValue)
                .font(.caption2)
                .foregroundColor(status.color)
        }
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: .init(id: 1, name: "test", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", status: .alive, episodes: []))
    }
}
