//
//  AuthenticationNavigationPath.swift
//  Stylor
//
//  Created by William Nelson on 19/08/2024.
//

import Foundation

/*
 Use of custom PathStore in order to navigate throughout the authentication / register process.
 It is better than using NavigationPath since we don't really know which values are stored, here
 we constrain ourselves to only use PathValue enum values.
 */
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
