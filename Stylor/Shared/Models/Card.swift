//
//  Card.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/07/2024.
//

import Foundation

struct Card {
    let user: User
}

extension Card: Identifiable {
    var id: String {return user.id}
}
