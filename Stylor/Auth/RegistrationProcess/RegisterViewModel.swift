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
    @Published var age: Date = Date()
    @Published var role: Occupation = .model
    @Published var isRegisteredComplete: Bool = false
    
    private func resetForm() {
        self.email = ""
        self.password = ""
        self.errorMessage = nil
        self.name = ""
        self.surname = ""
        self.role = .tailor
        self.age = Date()
    }
    

    
    func register(onSuccess: @escaping () -> Void) {
        let userService = UserApiService()
        let user = User(
            id: UUID().uuidString,
            name: name,
            surname: surname,
            age: age,
            role: role,
            userPortfolioImages: []
        )
        userService.addUser(user: user)
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isRegisteredComplete = false
                }
            } else {
                DispatchQueue.main.async {
                    // Handle successful registration
                    self.errorMessage = nil
                    print("User registered successfully: \(authResult?.user.email ?? "")")
                    UserDataService.shared.setCurrentUser(user)
                    guard let user = authResult?.user else { return }
                    user.sendEmailVerification { (error) in
                        if let error = error {
                            print("Error sending verification email: \(error.localizedDescription)")
                            return
                        }
                        print("Verification email sent.")
                    }
                    self.resetForm()
                    self.isRegisteredComplete = true
                    onSuccess()
                }
            }
        }
    }
}
