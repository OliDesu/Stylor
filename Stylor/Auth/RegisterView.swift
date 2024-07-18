//
//  RegisterView.swift
//  Stylor
//
//  Created by Ali El Mufti on 11/07/2024.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Nom", text: $viewModel.name )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
             TextField("Prénom", text: $viewModel.surname )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            DatePicker("Date de naissance", selection: $viewModel.age, displayedComponents: .date)
                          .datePickerStyle(GraphicalDatePickerStyle())
                          .padding()
            
            Button(action: {
                viewModel.register {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Register")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}

class RegisterViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var age : Date = Date(timeIntervalSinceNow: 0)
    
    

    func register(onSuccess: @escaping () -> Void) {
        let  userService = UserService()
        let user: User = User(id: UUID().uuidString,name: name, surname: surname, age: age, profileImagesURLs: [])
        print(user)
        userService.addUser(user: user)
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                // Handle successful registration
                self.errorMessage = nil
                print("User registered successfully: \(authResult?.user.email ?? "")")
                onSuccess()
            }
        }
    }
}
