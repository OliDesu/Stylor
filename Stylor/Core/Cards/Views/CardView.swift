//
//  CardView.swift
//  Stylor
//
//  Created by Ali El Mufti on 06/07/2024.
//

import SwiftUI

struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
   // @State private var cardOpacity: Double = 100.0
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
        .offset(x: xOffset)
      //  .opacity(cardOpacity)
        .rotationEffect(.degrees(degrees))
        .gesture(
            DragGesture().onChanged({
                value in
                withAnimation(.snappy){
                    xOffset = value.translation.width
                    degrees = Double(value.translation.width/25)
                    //cardOpacity = Double(value.translation.width/10000)
                }
            }
        ))
    }
    
   
}
 extension CardView {
   
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
