//
//  OccupationChoiceView.swift
//  Stylor
//
//  Created by Ali El Mufti on 26/07/2024.
//

import SwiftUI

struct OccupationChoiceView: View {
    @Environment(AuthenticationNavigationPathStore.self) var authPathStore

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
            authPathStore.navigate(to: .registerMailPassword)
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

#Preview {
    OccupationChoiceView(
        role: .constant(.model)
    )
}
