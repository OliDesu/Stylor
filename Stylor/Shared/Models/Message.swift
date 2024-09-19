import Foundation
import FirebaseInAppMessaging
import MessageKit

struct Message: MessageType, Equatable {
    let sender: SenderType
    let messageId: String
    let sentDate: Date
    let kind: MessageKind

    // Implementing Equatable for Message
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.sender.senderId == rhs.sender.senderId &&
               lhs.messageId == rhs.messageId &&
               lhs.sentDate == rhs.sentDate &&
               lhs.kind.isEqual(to: rhs.kind)
    }
}

// Manually comparing MessageKind
extension MessageKind {
    func isEqual(to other: MessageKind) -> Bool {
        switch (self, other) {
        case (.text(let text1), .text(let text2)):
            return text1 == text2
        // You can add other cases like `.photo`, `.video` here as needed
        default:
            return false
        }
    }
}

struct Sender: SenderType {
    let senderId: String
    let displayName: String
}
