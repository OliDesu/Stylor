//
//  AuthState.swift
//  Stylor
//
//  Created by William Nelson on 19/08/2024.
//

import Foundation

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
