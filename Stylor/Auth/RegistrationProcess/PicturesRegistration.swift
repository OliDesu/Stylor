//
//  PicturesRegistration.swift
//  Stylor
//
//  Created by Ali El Mufti on 19/07/2024.
//

import SwiftUI

struct PicturesRegistration: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @Binding var path: NavigationPath

    var body: some View {
        Text(
            "Smile"
        )
        Spacer()
        Button ("Finish"){
            viewModel.register(){
                path = NavigationPath()

                }
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
        PicturesRegistration(
            path: .constant(
                NavigationPath()
            )
        )
        .environmentObject(
            RegisterViewModel()
        )
    }
