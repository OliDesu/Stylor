//
//  AppView.swift
//  Stylor
//
//  Created by William Nelson on 19/08/2024.
//

import SwiftUI

/*
 This is basically our main view, StylorApp is our entry point but we don't want to put logic there.
 Here we can decide where to navigate according to different states of the app, for example AuthState,
 but it is possible to have many more observed states or user settings.
 It is also usefull if you want to handle alerts (pop-up) in a single place.
 Basically everything you want to handle on an App level (except AppDelegate or SceneDelegate)
 should be put here, use a ViewModel if you have to.
 */
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
