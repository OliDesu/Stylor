//
//  User.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/07/2024.
//

import Foundation
import FirebaseFirestoreSwift
struct User: Identifiable, Decodable {
    let id: String
    let firstName: String
    let lastName: String
    var age: Date
    var role: Occupation
    var userPortfolioImages: [String]
    var username: String 

    var keywordsForLookup: [String] {
        [username.generateStringSequence(), firstName.generateStringSequence(), lastName.generateStringSequence(), "\(firstName) \(lastName)".generateStringSequence()].flatMap { $0 }
    }

    init() {
        self.id = ""
        self.firstName = ""
        self.lastName = ""
        self.role = Occupation.model
        self.age = Date()
        self.userPortfolioImages = []
        self.username = "" // Initialize username
    }

    init(
        id: String,
        name: String,
        surname: String,
        age: Date,
        role: Occupation,
        userPortfolioImages: [String] = [],
        username: String = "" // Added username to the initializer
    ) {
        self.id = id
        self.firstName = name
        self.lastName = surname
        self.age = age
        self.role = role
        self.userPortfolioImages = userPortfolioImages
        self.username = username // Initialize username
    }
}
extension String {
    func generateStringSequence() -> [String] {
        var sequences: [String] = []
        for i in 1...self.count {
            sequences.append(String(self.prefix(i)))
        }
        return sequences
    }
}
