//
//  ViewExtension.swift
//  RickAndMortyChallenge
//
//  Created by Ezequiel Fritz on 10/5/23.
//

import SwiftUI

extension View {
    func onError(error: Binding<UiError?>, buttonTitle: String = "OK") -> some View {
        let wrappedValue = error.wrappedValue
        return alert(isPresented: .constant(wrappedValue != nil), error: wrappedValue) { _ in
            Button(buttonTitle) {
                error.wrappedValue = nil
            }
        } message: { error in
            Text(error.errorDescription ?? "")
        }
    }
}
