//
//  OccupationChoiceView.swift
//  Stylor
//
//  Created by Ali El Mufti on 26/07/2024.
//

import SwiftUI

struct OccupationChoiceView: View {
    
    @EnvironmentObject var viewModel: RegisterViewModel
    @Binding var path: NavigationPath
    var body: some View {
        Picker(
            "Role",
            selection: $viewModel.role
        ) {
            Text(
                "Model 🦹🏻"
            ).tag(
                Occupation.model
            )
            Text(
                "Tailor 🪡"
            ).tag(
                Occupation.tailor
            )
            Text(
                "Photographer 📸"
            ).tag(
                Occupation.photographer
            )
        }
        
        NavigationLink(destination: MailPasswordRegistration(path: $path).environmentObject(self.viewModel)) {
            Text("Next")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

#Preview {
    OccupationChoiceView(path: .constant(NavigationPath()))
}
