//
//  PortfolioView.swift
//  Stylor
//
//  Created by Ali El Mufti on 25/07/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct PortfolioView: View {
    @State var currentUser : User = MockData.averageUser

    var body: some View {
        VStack {
            Text("Wallpapers")
                .font(.system(.largeTitle, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.bottom, 8)
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4)], spacing: 4) {
                ForEach(currentUser.userPortfolioImages, id: \.self) { img in
                    WebImage(url: URL(string: img))
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(1, contentMode: .fit)
                        .clipped()
                        .padding()
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .accessibilityLabel("User uploaded image")
                }
            }
            .padding(.horizontal)
        }
        .padding(.top, 98)
        .padding(.bottom, 150)
    }
}

#Preview {
    PortfolioView()
}
