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
    @State private var header = "📸"

    var body: some View {
        VStack {
            TextField("Header", text: $header ).padding()
            TextField("Email", text: $email).padding()
            
            TextField("Password", text: $password).padding()
            
            Button("Login") {
                viewModel.login(email: email, password: password)
            }
            .clipShape(.capsule)
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel())
}
