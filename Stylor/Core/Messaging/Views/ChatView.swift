//
//  ChatView.swift
//  Stylor
//
//  Created by Ali El Mufti on 30/08/2024.
//

import UIKit
import MessageKit
import InputBarAccessoryView
import SwiftUI
import FirebaseAuth
class ChatView: MessagesViewController {

    private var viewModel = ChatViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMessageCollectionView()
        configureMessageInputBar()
        bindViewModel()
        viewModel.listenForMessages()
    }

    private func configureMessageCollectionView() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }

    private func configureMessageInputBar() {
        messageInputBar.delegate = self
    }

    private func bindViewModel() {
        viewModel.onMessagesUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.messagesCollectionView.reloadData()
                self?.messagesCollectionView.scrollToLastItem()
            }
        }
    }
}

// MARK: - MessagesDataSource
extension ChatView: MessagesDataSource {
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return viewModel.messages.count
    }

    func currentSender() -> SenderType {
        guard let user = Auth.auth().currentUser else {
            fatalError("No logged in user")
        }
        return Sender(senderId: user.uid, displayName: user.email ?? "Unknown")
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return viewModel.messages[indexPath.section]
    }

    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        return NSAttributedString(
            string: message.sentDate.description,
            attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.darkGray]
        )
    }
}

// MARK: - MessagesLayoutDelegate
extension ChatView: MessagesLayoutDelegate {
    
    func avatarSize(for message: MessageType, at indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: 30)
    }

    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath) -> CGFloat {
        return 20
    }

    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath) -> CGFloat {
        return 16
    }
}

// MARK: - MessagesDisplayDelegate
extension ChatView: MessagesDisplayDelegate {
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .blue : .lightGray
    }

    func shouldDisplayHeader(for message: MessageType, at indexPath: IndexPath) -> Bool {
        return true
    }

    func messageStyle(for message: MessageType, at indexPath: IndexPath) -> MessageStyle {
        let corner: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(corner, .curved)
    }
}

// MARK: - InputBarAccessoryViewDelegate
extension ChatView: InputBarAccessoryViewDelegate {
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        viewModel.sendMessage(text: text)
        inputBar.inputTextView.text = ""
    }
}



#Preview {
    ChatView()
}
