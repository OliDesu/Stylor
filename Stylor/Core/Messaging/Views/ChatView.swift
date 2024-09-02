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

import UIKit
import MessageKit
import MessageInputBar

class ChatViewController: MessagesViewController {

    private var messages: [Message] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

        messageInputBar.sendButton.setTitleColor(.white, for: .disabled)
        messageInputBar.sendButton.setTitleColor(.white, for: .normal)
        messageInputBar.sendButton.setTitleColor(.white, for: .highlighted)
        messageInputBar.sendButton.setTitle(strings.send, for: .normal)
        messageInputBar.inputTextView.tintColor = .white
        messageInputBar.inputTextView.placeholderTextColor = .white
        messageInputBar.inputTextView.textColor = .white
        messageInputBar.inputTextView.placeholder = "placeholder"
        messagesCollectionView.backgroundColor = .white
        messageInputBar.backgroundView.backgroundColor = .blue


        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messageCellDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        messageInputBar.delegate = self
        messagesCollectionView.messagesDisplayDelegate = self

        scrollsToBottomOnKeyboardBeginsEditing = true // default false
        maintainPositionOnKeyboardFrameChanged = true // default false

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

extension ChatViewController: MessagesLayoutDelegate {
    func heightForLocation(message: MessageType, at indexPath: IndexPath, with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
}

extension ChatViewController: MessagesDisplayDelegate {

    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {

        let message = messages[indexPath.section]
        if let userimage = URL(string: message.member.image) {
            //Nuke.loadImage(with: userimage, options: config.options_stream, into: avatarView)
            print("Image URL : \(userimage)")
        }
        avatarView.backgroundColor = .black
    }

    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        let tail: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(tail, .curved)
    }
}

extension ChatViewController: MessageInputBarDelegate {

    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        print("Message : \(text)")
    }
}
#Preview {
    ChatView()
}
