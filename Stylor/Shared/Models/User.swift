//
//  User.swift
//  Stylor
//
//  Created by Ali El Mufti on 16/07/2024.
//

import Foundation

struct User: Identifiable {
    let id: String?
    let name: String
    let surname:String
    var age: Date
    var profileImagesURLs: [String]
    
    init(
        id: String? = nil,
        name: String,
        surname: String,
        age: Date,
        profileImagesURLs: [String] = []
    ) {
         self.id = id
         self.name = name
         self.surname = surname
         self.age = age
         self.profileImagesURLs = profileImagesURLs
     }
}
