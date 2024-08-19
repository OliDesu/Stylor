//
//  SpinnerView.swift
//  Stylor
//
//  Created by Ali El Mufti on 21/07/2024.
//

import SwiftUI

struct SpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(2.0, anchor: .center)
    }
}
