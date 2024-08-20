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
    @State private var currentImageIndex = 0
   // @State private var cardOpacity: Double = 100.0
    let model: Card
    
    var body: some View {
        ZStack(
            alignment: .bottom
        ){
            ZStack(
                alignment:.top
            ) {
                Image(
                    model.user.userPortfolioImages[currentImageIndex]
                )
                .resizable()
                .overlay {
                    ImageScrollingOverlay(
                        currentImageIndex :$currentImageIndex,
                        imageCount: imageCount
                    )
                }
                SwipeActionIndicatorView(
                    xOffset: $xOffset
                )
            }
            UserInfoView()
                .padding(
                    .horizontal
                )
                .foregroundStyle(
                    .white
                )
        }
        .frame(
            width: SizeConstants.cardWidth,
            height: SizeConstants.cardHeight
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius:10
            )
        )
        .offset(
            x: xOffset
        )
        //  .opacity(cardOpacity)
        .rotationEffect(
            .degrees(
                degrees
            )
        )
        .animation(
            .snappy,
            value: xOffset
        )
        .gesture(
            DragGesture().onChanged(
                onDragChanged
            ).onEnded(
                onDragEnded
            )
        )
    }
    
    
}
private extension CardView {
    var user: User {
        return model.user
    }
    var imageCount: Int {
        return user.userPortfolioImages.count
    }
}
private extension CardView {
    func returnToCenter()
    {
        xOffset = 0
        degrees = 0
        
    }    
    func swipeRight() {
        xOffset = 500
        degrees = 12
    }
    func swipeLeft() {
        xOffset = -500
        degrees = -12
    }
}


private extension CardView{
    func onDragChanged(
        _ value: _ChangedGesture<DragGesture>.Value
    ){
        xOffset = value.translation.width
        degrees = Double(
            value.translation.width/25
        )
    }
    func onDragEnded(
        _ value: _ChangedGesture<DragGesture>.Value
    ){
        let width = value.translation.width
        if abs(
            width
        ) <= abs(
            SizeConstants.screenCutOff
        ) {
            returnToCenter()
            return
        }
        if width >= SizeConstants.screenCutOff  {
            swipeRight()
        }
        else {
            swipeLeft()
        }
    }
}


#Preview {
    CardView(
        model: Card(
            user: MockData.users[0]
        )
    )
}
