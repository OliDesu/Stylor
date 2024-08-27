//
//  ChatViewController.swift
//  Stylor
//
//  Created by Ali El Mufti on 27/08/2024.
//
// ChatViewController.swift
import UIKit
import MessageKit
import InputBarAccessoryView
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: MessagesViewController {

    private var messages: [Message] = []
    private let db = Firestore.firestore()
    private var messageListener: ListenerRegistration?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMessageCollectionView()
        configureMessageInputBar()
        listenForMessages()
    }

    private func configureMessageCollectionView() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }

    private func configureMessageInputBar() {
        messageInputBar.delegate = self
    }

    private func listenForMessages() {
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

            self.messagesCollectionView.reloadData()
            self.messagesCollectionView.scrollToLastItem()
        }
    }
}

extension ChatViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        return Sender(senderId: Auth.auth().currentUser?.uid ?? "", displayName: Auth.auth().currentUser?.email ?? "Unknown")
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 1
    }

    func numberOfItems(inSection section: Int, in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.item]
    }
}

extension ChatViewController: MessagesLayoutDelegate, MessagesDisplayDelegate {
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .blue : .gray
    }
}

extension ChatViewController: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
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

        inputBar.inputTextView.text = ""
    }
}
