//
//  CardService.swift
//  Stylor
//
//  Created by Ali El Mufti on 17/07/2024.
//

import Foundation

struct CardService {
    func fetchCardModels() async throws -> [Card]{
        let users = MockData.users
        return users.map({
            Card(user: $0)
        })
    }
}
