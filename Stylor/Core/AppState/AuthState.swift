//
//  AuthState.swift
//  Stylor
//
//  Created by William Nelson on 19/08/2024.
//

import Foundation

/*
 This is a pretty common pattern to handle authentication state. It allows us to
 modify the state of authentication from anywhere and observe the changes at the same time.
 In our case we are observing the value in AppView.
 */
@Observable
class AuthState {
    static let shared: AuthState = AuthState()

    private(set) var state: Value

    init(state: Value = .loggedOut) {
        self.state = state
    }

    func update(to value: Value) {
        state = value
    }

    enum Value {
        case loggedIn, loggedOut
    }
}
