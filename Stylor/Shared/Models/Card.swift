//
//  Card.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/07/2024.
//
import Foundation

struct Card: Identifiable {
    let user: User
    
    var id: String {
        return user.id ?? UUID().uuidString // Generate a temporary ID if user.id is nil
    }
}
