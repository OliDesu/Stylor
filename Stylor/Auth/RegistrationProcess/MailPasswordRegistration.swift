//
//  MailPasswordRegistration.swift
//  Stylor
//
//  Created by Ali El Mufti on 19/07/2024.
//

import SwiftUI

struct MailPasswordRegistration: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @Binding var path: NavigationPath

    var body: some View {
    
        TextField(
            "Email",
            text: $viewModel.email
        )
        .autocapitalization(
            .none
        )
        .textFieldStyle(
            RoundedBorderTextFieldStyle()
        )
        .padding()
        
        SecureField(
            "Password",
            text: $viewModel.password
        )
        .textFieldStyle(
            RoundedBorderTextFieldStyle()
        )
        .padding()
        Spacer()
        NavigationLink(
            destination: PicturesRegistration(path:$path) .environmentObject(
                self.viewModel
            )
        ) {
            Text(
                "Next"
            )
            .padding()
            .background(
                Color.black
            )
            .foregroundColor(
                .white
            )
            .cornerRadius(
                8
            )
        }
        if let errorMessage = viewModel.errorMessage {
            Text(
                errorMessage
            )
            .foregroundColor(
                .red
            )
                .padding()
        }
    }
}

#Preview {
    MailPasswordRegistration(path: .constant(
        NavigationPath()
    )
)
.environmentObject(
    RegisterViewModel())
}
