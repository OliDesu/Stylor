//
//  CardMock.swift
//  Stylor
//
//  Created by Ali El Mufti on 17/07/2024.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            name: "Lionel",
            surname: "Messi",
            age: Date(),
            userPortfolioImages: ["messi","messi3"]
        ),   .init(
            id: NSUUID().uuidString,
            name: "La fraude",
            surname: "Pele",
            age: Date(),
            userPortfolioImages: ["messi","messi2","messi3"]
        ), .init(
            id: NSUUID().uuidString,
            name: "L'eternel second",
            surname: "Cristiano",
            age: Date(),
            userPortfolioImages: ["messi","messi2","messi3"]
        ), .init(
            id: NSUUID().uuidString,
            name: "Le gros nullos",
            surname: "Mbappard",
            age: Date(),
            userPortfolioImages: ["messi","messi2","messi3"]
        )
    ]
}
