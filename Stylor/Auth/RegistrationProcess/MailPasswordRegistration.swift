//
//  MailPasswordRegistration.swift
//  Stylor
//
//  Created by Ali El Mufti on 19/07/2024.
//

import SwiftUI
import SwiftUI

import SwiftUI

struct MailPasswordRegistration: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @Binding var path: NavigationPath
    @State private var isLoading: Bool = false
    @State private var navigateToPicturesRegistration: Bool = false
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Spacer()
            
            if isLoading {
                SpinnerView()
            } else {
                Button(action: {
                    isLoading = true
                    viewModel.register {
                        self.isLoading = false
                        if viewModel.isRegisteredComplete {
                            self.navigateToPicturesRegistration = true
                        }
                    }
                }) {
                    Text("Next")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .background(
            NavigationLink(
                destination: PicturesRegistration(path: $path)
                    .environmentObject(viewModel),
                isActive: $navigateToPicturesRegistration
            ) {
                EmptyView()
            }
        )
    }
}

#Preview {
    MailPasswordRegistration(path: .constant(NavigationPath()))
        .environmentObject(RegisterViewModel())
}
