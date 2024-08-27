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
struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}
