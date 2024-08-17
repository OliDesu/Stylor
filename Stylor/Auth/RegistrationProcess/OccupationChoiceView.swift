//
//  OccupationChoiceView.swift
//  Stylor
//
//  Created by Ali El Mufti on 26/07/2024.
//

import SwiftUI

struct OccupationChoiceView: View {
    @Binding var path: AuthenticationNavigationPath
    
    @Binding var role: Occupation
    
    var body: some View {
        Picker(
            "Role",
            selection: $role
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
        
        Button("Next") {
            path.navigate(to: .registerMailPassword)
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
        
//        NavigationLink(destination: MailPasswordRegistration(path: $path).environmentObject(self.viewModel)) {
//            Text("Next")
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(8)
//        }
    }
}

#Preview {
    OccupationChoiceView(
        path: .constant(
            AuthenticationNavigationPath()
        ),
        role: .constant(.model)
    )
}
