//
//  LoginViewModel.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/08/2024.
//

import Foundation
import FirebaseAuth
import Combine

@Observable
class LoginViewModel {

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("Failed to login:", error)
                return
            }
            
            // Successfully logged in
            print("Successfully logged in with user:", result?.user.uid ?? "")
            AuthState.shared.update(to: .loggedIn)
        }
    }
}
