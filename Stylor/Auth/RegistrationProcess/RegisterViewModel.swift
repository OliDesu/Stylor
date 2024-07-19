//
//  RegisterView.swift
//  Stylor
//
//  Created by Ali El Mufti on 11/07/2024.
//

import SwiftUI
import FirebaseAuth


public class RegisterViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var age : Date = Date(
        timeIntervalSinceNow: 0
    )
    
    
    
    func register(
        onSuccess: @escaping () -> Void
    ) {
        let  userService = UserService()
        let user: User = User(
            id: UUID().uuidString,
            name: name,
            surname: surname,
            age: age,
            profileImagesURLs: []
        )
        print(
            user
        )
        userService.addUser(
            user: user
        )
        Auth.auth().createUser(
            withEmail: email,
            password: password
        ) {
            authResult,
            error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                // Handle successful registration
                self.errorMessage = nil
                print(
                    "User registered successfully: \(authResult?.user.email ?? "")"
                )
                onSuccess()
            }
        }
    }
}
