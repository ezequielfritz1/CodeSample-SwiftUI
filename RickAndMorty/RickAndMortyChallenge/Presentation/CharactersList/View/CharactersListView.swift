//
//  CharactersListView.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

import SwiftUI

struct CharactersListView: View {
    // MARK: - Public Properties
    @ObservedObject var viewModel: CharactersListViewModel
    @State private var searchText = ""

    // MARK: - Body
    var body: some View {
        NavigationStack {
            List(viewModel.characters) { character in
                NavigationLink(value: character) {
                    CharacterRow(character: character)
                }
            }
            .navigationDestination(for: UiCharacter.self, destination: {
                CharacterDetailConfigurator.configCharacterDetail(character: $0)
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Text("Characters")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                viewModel.onSearch($0)
            }
            .task {
                await viewModel.onAppear()
            }
            .onError(error: $viewModel.error)
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView(viewModel: .init())
    }
}
