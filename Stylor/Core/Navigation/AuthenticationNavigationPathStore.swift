//
//  AuthenticationNavigationPath.swift
//  Stylor
//
//  Created by William Nelson on 19/08/2024.
//

import Foundation

@Observable
class AuthenticationNavigationPathStore {
    var path: [PathValue]

    init(path: [PathValue] = [PathValue]()) {
        self.path = path
    }

    func navigate(to value: PathValue) {
        path.append(value)
    }

    func back() {
        path.removeLast()
    }

    func popToFirst() {
        path.removeAll()
    }

    enum PathValue: Codable, Hashable {
        case logIn, registerName, registerOccupation, registerMailPassword, registerPicture
    }
}
