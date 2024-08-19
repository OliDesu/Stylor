//
//  CardStackView.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/07/2024.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var viewModel = CardViewModel(
        service: CardApiService()
    )
    var body: some View {
        ZStack{
            // To change to a while person present in the area
            ForEach(
                viewModel.cardModels
            ) {
                card in
                CardView(model: card)
            }
        }
    }
}

#Preview {
    CardStackView()
}
