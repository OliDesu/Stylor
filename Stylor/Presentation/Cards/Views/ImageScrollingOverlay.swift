//
//  ImageScrollingOverlay.swift
//  Stylor
//
//  Created by Ali El Mufti on 17/07/2024.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currentImageIndex: Int
    @State var imageCount: Int
    var body: some View {
        HStack{
            Rectangle().onTapGesture {
                updateImageIndex(
                    increment: false
                )
                
                
            }
            Rectangle().onTapGesture {
                updateImageIndex(
                    increment: true
                )
            }
            
        }.foregroundStyle(
            .black.opacity(
                0.01
            )
        )
    }
}

private extension ImageScrollingOverlay {
    func updateImageIndex(
        increment: Bool
    ) {
        if(
            increment
        ) {
            guard currentImageIndex < imageCount - 1 else {
                return
            }
            currentImageIndex += 1
        }
        else{
            guard currentImageIndex > 0 else {
                return
            }
            currentImageIndex -= 1
        }
    }
}

#Preview {
    ImageScrollingOverlay(
        currentImageIndex: .constant(
            0
        ),
        imageCount: 1
    )
}
