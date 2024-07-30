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
                .clipped()
                .padding(.leading)
                .padding(.bottom, 8)
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 4), GridItem(.flexible(), spacing: 4)], spacing: 4) {
                ForEach(currentUser.userPortfolioImages, id:\.self) { img in // Replace with your data model here
                    WebImage(url: img)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .aspectRatio(1/1, contentMode: .fit)
                        .clipped()
                        .mask { RoundedRectangle(cornerRadius: 30, style: .continuous) }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .padding(.top, 98)
        .padding(.bottom, 150)
    }
}

#Preview {
    PortfolioView()
}
