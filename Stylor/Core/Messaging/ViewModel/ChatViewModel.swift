//
//  ChatViewModel.swift
//  Stylor
//
//  Created by Ali El Mufti on 01/09/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ChatViewModel {

    private var db = Firestore.firestore()
    private var messageListener: ListenerRegistration?
    var messages: [Message] = [] {
        didSet {
            self.onMessagesUpdated?()
        }
    }
    var onMessagesUpdated: (() -> Void)?
    
    func listenForMessages() {
        messageListener = db.collection("chats").order(by: "timestamp").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.messages = documents.compactMap { queryDocumentSnapshot -> Message? in
                let data = queryDocumentSnapshot.data()
                let senderId = data["senderId"] as? String ?? ""
                let displayName = data["displayName"] as? String ?? ""
                let text = data["text"] as? String ?? ""
                let timestamp = data["timestamp"] as? Timestamp ?? Timestamp()
                return Message(sender: Sender(senderId: senderId, displayName: displayName),
                               messageId: queryDocumentSnapshot.documentID,
                               sentDate: timestamp.dateValue(),
                               kind: .text(text))
            }
        }
    }

    func sendMessage(text: String) {
        guard let user = Auth.auth().currentUser else { return }
        
        let messageData: [String: Any] = [
            "senderId": user.uid,
            "displayName": user.email ?? "Unknown",
            "text": text,
            "timestamp": FieldValue.serverTimestamp()
        ]

        db.collection("chats").addDocument(data: messageData) { error in
            if let error = error {
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }

    deinit {
        messageListener?.remove()
    }
}
