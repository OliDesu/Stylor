//
//  UserDataService.swift
//  Stylor
//
//  Created by Ali El Mufti on 21/07/2024.
//
import Foundation

class UserDataService {
    static let shared = UserDataService()
    
    private var currentUser: User
    private let queue = DispatchQueue(label: "com.Stylor.UserDataServiceQueue", attributes: .concurrent)
    
    private init() {
        self.currentUser = User() // Initialize with a default user
    }
    
    func getCurrentUser() -> User {
        var user: User!
        queue.sync {
            user = self.currentUser
        }
        return user
    }
    
    func setCurrentUser(_ user: User) {
        queue.async(flags: .barrier) {
            self.currentUser = user
        }
    }
    
    func clearCurrentUser() {
        queue.async(flags: .barrier) {
            self.currentUser = User() // Clear to default user
        }
    }
}
