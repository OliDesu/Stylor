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
            ZStack(alignment:.top) {
                Image(.messi)
                    .resizable()
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            UserInfoView()
                .padding(.horizontal)
                .foregroundStyle(.white)
        }
        .frame(width: SizeConstants.cardWidth,height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle( cornerRadius:10))
        .offset(x: xOffset)
      //  .opacity(cardOpacity)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture().onChanged(
                onDragChanged
            ).onEnded(
                onDragEnded
            )
                                   )
    }
    
   
}
private extension CardView{
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        xOffset = value.translation.width
        degrees = Double(value.translation.width/25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value){
        let width = value.translation.width
        if abs(width) <= abs(SizeConstants.screenCutOff) {
            xOffset = 0
            degrees = 0
        }
    }
}

#Preview {
    CardView()
}
