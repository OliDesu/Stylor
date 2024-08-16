//
//  LoginView.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/08/2024.
//

import SwiftUI

struct LoginView: View {
    @State private(set) var viewModel: LoginViewModel
    @State private var email = ""
    @State private var password = ""
    
    @Binding var didLogin: Bool
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            
            TextField("Password", text: $password)
            
            Button("Login") {
                viewModel.login(email: email, password: password)
            }
            .clipShape(.capsule)
        }
        .onReceive(viewModel.didLogin) { _ in
            didLogin = true
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(), didLogin: .constant(false))
}
