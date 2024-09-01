//
//  Message.swift
//  Stylor
//
//  Created by Ali El Mufti on 25/08/2024.
//

import Foundation
import SwiftUI
import FirebaseInAppMessaging
import MessageKit

struct Message: MessageType {
    let sender: SenderType
    let messageId: String
    let sentDate: Date
    let kind: MessageKind
}

struct Sender: SenderType {
    let senderId: String
    let displayName: String
}
