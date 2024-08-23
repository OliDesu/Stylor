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
            
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 10)
                    ],
                    spacing: 4
                ) {
                    ForEach(currentUser.userPortfolioImages, id: \.self) { img in
                        PortfolioCard(img: .constant(img))
                    }
                }
            }
        }
        .padding(.top, 98)
        .padding(.bottom, 150)
    }
}

#Preview {
    PortfolioView()
}
