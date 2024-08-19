//
//  AppView.swift
//  Stylor
//
//  Created by William Nelson on 19/08/2024.
//

import SwiftUI

struct AppView: View {
    @State private var authState: AuthState = AuthState.shared

    var body: some View {
        VStack {
            switch authState.state {
            case .loggedIn:
                MainTabView()
            case .loggedOut:
                AuthenticationView()
            }
        }
        .padding()
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    AppView()
}
