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
    weak var delegate: RegisterDelegate?
    
    @Binding var path: AuthenticationNavigationPath
    @Binding var email: String
    @Binding var password: String
    @Binding var isRegisteredComplete: Bool
    @Binding var errorMessage: String?
    @State private var isLoading: Bool = false
    @State private var navigateToPicturesRegistration: Bool = false
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Spacer()
            
            if isLoading {
                SpinnerView()
            } else {
                Button() {
                    isLoading = true
                    delegate?.register() //{
//                        self.isLoading = false
//                        if isRegisteredComplete {
//                            self.navigateToPicturesRegistration = true
//                        }
//                    }
                } label: {
                    Text("Next")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
        .onChange(of: isRegisteredComplete, { _, newValue in
            if newValue {
                path.navigate(to: .registerPicture)
            }
        })
//        .background(
//            NavigationLink(
//                destination: PicturesRegistration(path: $path)
//                    .environmentObject(viewModel),
//                isActive: $navigateToPicturesRegistration
//            ) {
//                EmptyView()
//            }
//        )
    }
}

protocol RegisterDelegate: AnyObject {
    func register()
}


#Preview {
    MailPasswordRegistration(
        path: .constant(AuthenticationNavigationPath()),          // Provide a default value for the path
        email: .constant(""),                   // Provide a default value for the email
        password: .constant(""),                // Provide a default value for the password
        isRegisteredComplete: .constant(false), // Provide a default value for registration status
        errorMessage: .constant(nil)            // Provide a default value for the error message
    )
    .environmentObject(RegisterViewModel())     // This will be used if your view relies on a ViewModel
}
