//
//  UiCharacterStatus.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

import SwiftUI

enum UiCharacterStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"

    var color: Color {
        switch self {
        case .alive:
            return .green
        case .dead:
            return .red
        case .unknown:
            return .gray
        }
    }
}
