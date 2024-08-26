//
//  Message.swift
//  Stylor
//
//  Created by Ali El Mufti on 25/08/2024.
//

import Foundation
import SwiftUI
import FirebaseInAppMessaging
public struct Message: Identifiable, Hashable {

    public enum Status: Equatable, Hashable {
        case sending
        case sent
        case read
    }
    public var id: String
    public var user: User
    public var status: Status?
    public var createdAt: Date

    public var text: String

    public var replyMessage: ReplyMessage?

    public static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id &&
               lhs.user == rhs.user &&
               lhs.status == rhs.status &&
               lhs.createdAt == rhs.createdAt &&
               lhs.text == rhs.text &&
               lhs.replyMessage == rhs.replyMessage
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(user)
        hasher.combine(status)
        hasher.combine(createdAt)
        hasher.combine(text)
        hasher.combine(replyMessage)
    }
}
