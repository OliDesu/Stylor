//
//  User.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/07/2024.
//

import Foundation

struct User: Identifiable {

    let id: String
    let name: String
    let surname:String
    var age: Date
    var role: Occupation
    var userPortfolioImages: [String]
    init() {
        self.id = ""
        self.name = ""
        self.surname = ""
        self.role = Occupation.model
        self.age = Date()
        self.userPortfolioImages = []
    }
    init(
        id: String,
        name: String,
        surname: String,
        age: Date,
        role: Occupation,
        userPortfolioImages: [String] = []
    ) {
         self.id = id
         self.name = name
         self.surname = surname
         self.age = age
        self.role = role
         self.userPortfolioImages = userPortfolioImages
     }
}
