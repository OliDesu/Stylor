//
//  CardView.swift
//  Stylor
//
//  Created by Ali El Mufti on 06/07/2024.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .bottom){
            Image(.messi)
                .resizable()
                
            UserInfoView()
                .padding(.horizontal)
                .foregroundStyle(.white)
        }
        .frame(width: cardWidth,height: cardHeight)
        .clipShape(RoundedRectangle( cornerRadius:10))
    }
    
   
}
private extension CardView {
   
    var cardWidth: CGFloat {
      UIScreen.main.bounds.width-20
  }
   
   var cardHeight: CGFloat {
      UIScreen.main.bounds.height / 1.45
  }
}
#Preview {
    CardView()
}
