//
//  LandingView.swift
//  Stylor
//
//  Created by Ali El Mufti on 19/07/2024.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack {
            Spacer()
            Divider()
            Text("🎨🪡🦹🏻")
                .font(.largeTitle)
                .fixedSize(horizontal: true, vertical: true)
                .foregroundStyle(.primary)
            Divider()
            Spacer()
            
            Text("Are you new here ?")
                .font(.title2)
                .foregroundStyle(.primary)
                .frame(alignment: .center)
                .font(.system(size: 10, weight: .regular, design: .default))
                .fixedSize(horizontal: false, vertical: false)
            Spacer()
            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .padding(.top, 53)
        .padding(.bottom, 0)
        .overlay(alignment: .top) {
 
        }    }
}

#Preview {
    LandingView()
}
