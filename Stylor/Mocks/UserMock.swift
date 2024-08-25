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
            username: "Messi",
            age: Date(),
            role: .model,
            userPortfolioImages: ["messi","messi3"]
        ),   .init(
            id: NSUUID().uuidString,
            name: "La fraude",
            surname: "Pele",
            username: "Messi",
            age: Date(),
            role: .model,
            userPortfolioImages: ["messi","messi2","messi3"]
        ), .init(
            id: NSUUID().uuidString,
            name: "L'eternel second",
            surname: "Cristiano",
            username: "Messi",

            age: Date(),
            role: .model,

            userPortfolioImages: ["messi","messi2","messi3"]
        ), .init(
            id: NSUUID().uuidString,
            name: "Le gros nullos",
            surname: "Mbappard",
            username: "Messi",

            age: Date(),            role: .model,
            userPortfolioImages: ["messi","messi2","messi3"]
        )
    ]
    static let averageUser = User(
        id: NSUUID().uuidString,
        name: "Lionel",
        surname: "Messi",
        username: "lm10",
        age: Date(),
        role: .model,
        userPortfolioImages: ["https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F7D28C056-B932-44B7-9D13-9B6C92B17D17?alt=media&token=1c0489db-1b95-4a0b-a2db-3c4d1d0959dc","https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F51FDD639-3142-4EBD-A5F7-55FC7A91EF26?alt=media&token=0e7e37ef-dbd5-4f54-be5b-5dd5ade661ef","https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F7D28C056-B932-44B7-9D13-9B6C92B17D17?alt=media&token=1c0489db-1b95-4a0b-a2db-3c4d1d0959dc","https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F51FDD639-3142-4EBD-A5F7-55FC7A91EF26?alt=media&token=0e7e37ef-dbd5-4f54-be5b-5dd5ade661ef","https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F7D28C056-B932-44B7-9D13-9B6C92B17D17?alt=media&token=1c0489db-1b95-4a0b-a2db-3c4d1d0959dc","https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F51FDD639-3142-4EBD-A5F7-55FC7A91EF26?alt=media&token=0e7e37ef-dbd5-4f54-be5b-5dd5ade661ef","https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F7D28C056-B932-44B7-9D13-9B6C92B17D17?alt=media&token=1c0489db-1b95-4a0b-a2db-3c4d1d0959dc","https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F51FDD639-3142-4EBD-A5F7-55FC7A91EF26?alt=media&token=0e7e37ef-dbd5-4f54-be5b-5dd5ade661ef","https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F7D28C056-B932-44B7-9D13-9B6C92B17D17?alt=media&token=1c0489db-1b95-4a0b-a2db-3c4d1d0959dc","https://firebasestorage.googleapis.com:443/v0/b/stylor-life.appspot.com/o/userPortfolioImages%2F228A1F6B-9469-4549-9CF6-7A430F082713%2F51FDD639-3142-4EBD-A5F7-55FC7A91EF26?alt=media&token=0e7e37ef-dbd5-4f54-be5b-5dd5ade661ef"]
        )
}
