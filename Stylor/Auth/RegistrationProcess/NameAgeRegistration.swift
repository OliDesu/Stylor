//
//  NameRegistration.swift
//  Stylor
//
//  Created by Ali El Mufti on 19/07/2024.
//

import SwiftUI

struct NameAgeRegistration: View {
    @EnvironmentObject var viewModel: RegisterViewModel
    @Binding var path: NavigationPath
    var body: some View {
        
        
        Text(
            "Aaah yes sweet sweet data"
        )
        
        Spacer()
        TextField(
            "Nom",
            text: $viewModel.name
        )
        .textFieldStyle(
            RoundedBorderTextFieldStyle()
        )
        .padding()
        
        TextField(
            "Prénom",
            text: $viewModel.surname
        )
        .textFieldStyle(
            RoundedBorderTextFieldStyle()
        )
        .padding()
        DatePicker(
            "Date de naissance",
            selection: $viewModel.age,
            displayedComponents: .date
        )
        .datePickerStyle(
            GraphicalDatePickerStyle()
        )
        .padding()
        Spacer()
        NavigationLink(
            destination: MailPasswordRegistration(path:$path)                    .environmentObject(self.viewModel)

        ) {
            Text(
                "Next"
            )
            .padding()
            .background(
                Color.blue
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
    NameAgeRegistration(path: .constant(
        NavigationPath()
    )
)
.environmentObject(
    RegisterViewModel())
}
