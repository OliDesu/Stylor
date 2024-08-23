//
//  PortfolioCard.swift
//  Stylor
//
//  Created by Ali El Mufti on 23/08/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct PortfolioCard: View {
    @Binding var img: String
    @State private var isLiked = false

    var body: some View {
        VStack(content: {
            WebImage(url: URL(string: img))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .padding()
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .accessibilityLabel("User uploaded image")
            Button {
                isLiked.toggle()
            } label: {
                LikeButton(isLiked: isLiked)
            }
        })
    }
}
struct LikeButton: View {
    
    var isLiked: Bool
    
    var body: some View {
        Image(systemName: isLiked ? "heart.fill" : "heart")
            .font(.system(size: 26))
            .foregroundStyle(isLiked ? .red : .primary)
    }
}
#Preview {
    PortfolioCard(img: .constant(MockData.averageUser.userPortfolioImages[0]))
}
