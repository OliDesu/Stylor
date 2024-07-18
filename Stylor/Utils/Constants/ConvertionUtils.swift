//
//  ConvertionUtils.swift
//  Stylor
//
//  Created by Ali El Mufti on 18/07/2024.
//

import SwiftUI

public struct ConvertionUtils {
    
    static func calculateAge(from date: Date) -> Int {
          let calendar = Calendar.current
          let ageComponents = calendar.dateComponents([.year], from: date, to: Date())
          return ageComponents.year ?? 0
      }
}
