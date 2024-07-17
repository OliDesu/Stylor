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
            fullName: "Lionel Messi",
            age: 37,
            profileImagesURLs: ["messi","messi2","messi3"]
        ),    .init(
            id: NSUUID().uuidString,
            fullName: "David Messi",
            age: 32,
            profileImagesURLs: ["messi2"]
        ),    .init(
            id: NSUUID().uuidString,
            fullName: "Thiago Messi",
            age: 12,
            profileImagesURLs: ["messi3"]
        ),    .init(
            id: NSUUID().uuidString,
            fullName: "Antonella Messi",
            age: 33,
            profileImagesURLs: ["messi"]
        )
    ]
}
