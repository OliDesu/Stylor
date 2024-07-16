//
//  SwipeActionIndicatorView.swift
//  Stylor
//
//  Created by Ali El Mufti on 15/07/2024.
//

import SwiftUI

struct SwipeActionIndicatorView: View {
    @Binding var xOffset: CGFloat
    var body: some View {
        HStack {
            Text("YAS")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 48)
                }
                .rotationEffect(.degrees(-45))
                .opacity(Double(xOffset/SizeConstants.screenCutOff))


            Spacer()
            Text("NAH")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 48)
                }
                .rotationEffect(.degrees(45))
                .opacity(Double(xOffset/SizeConstants.screenCutOff) * -1)

        }
        .padding(40)
    }
}
#Preview {
    SwipeActionIndicatorView(xOffset: .constant(20))
}
