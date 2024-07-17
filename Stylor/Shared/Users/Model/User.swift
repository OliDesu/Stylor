//
//  User.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/07/2024.
//

import Foundation
struct User: Identifiable {
    let id: String
    let fullName: String
    var age: Int
    var profileImageURLs: [String]
}
