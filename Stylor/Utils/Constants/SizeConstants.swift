//
//  SizeConstants.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/07/2024.
//

import SwiftUI

public struct SizeConstants {
    struct Card {
        
    }
   static  var screenCutOff: CGFloat {
      (UIScreen.main.bounds.width / 2) *  0.8

    }
   static var cardWidth: CGFloat {
      UIScreen.main.bounds.width-20
  }
   
   static var cardHeight: CGFloat {
      UIScreen.main.bounds.height / 1.45
  }
}
