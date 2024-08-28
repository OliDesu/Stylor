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
import MessageInputBar

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
extension ChatViewController: MessagesDataSource, MessageCellDelegate, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

    func currentSender() -> Sender {
        return Sender(id: member.messageID, displayName: member.name)
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }

    func didTapAvatar(in cell: MessageCollectionViewCell) {
        guard let indexPath = messagesCollectionView.indexPath(for: cell) else { return }
        let message = messages[indexPath.section]
        print("Message : \(message)")
    }

    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 12
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
