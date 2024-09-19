//  ConversationView.swift
//  Stylor
//
//  Created by Ali El Mufti on 17/09/2024.
//

import SwiftUI
import MessageKit

struct ConversationView: View {
    @State private var messages: [Message] = [
        Message(sender: Sender(senderId: "1", displayName: "User 1"),
                messageId: UUID().uuidString,
                sentDate: Date(),
                kind: .text("Hello!")),
        Message(sender: Sender(senderId: "2", displayName: "User 2"),
                messageId: UUID().uuidString,
                sentDate: Date(),
                kind: .text("Hi there!"))
    ]
    
    @State private var inputMessage: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack(spacing: 10) {
                        ForEach(messages, id: \.messageId) { message in
                            HStack {
                                if message.sender.senderId == "1" {
                                    Spacer()
                                    Text(messageText(from: message.kind))
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .frame(maxWidth: 250, alignment: .trailing)
                                } else {
                                    Text(messageText(from: message.kind))
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                        .frame(maxWidth: 250, alignment: .leading)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .onAppear {
                        scrollView.scrollTo(messages.last?.messageId, anchor: .bottom)
                    }
                    .onChange(of: messages) { _ in
                        scrollView.scrollTo(messages.last?.messageId, anchor: .bottom)
                    }
                }
            }
            
            Divider()
            
            HStack {
                TextField("Enter message...", text: $inputMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            .padding()
        }
    }
    
    func sendMessage() {
        if !inputMessage.isEmpty {
            let newMessage = Message(sender: Sender(senderId: "1", displayName: "User 1"),
                                     messageId: UUID().uuidString,
                                     sentDate: Date(),
                                     kind: .text(inputMessage))
            messages.append(newMessage)
            inputMessage = ""
        }
    }
    
    func messageText(from kind: MessageKind) -> String {
        switch kind {
        case .text(let text):
            return text
        default:
            return ""
        }
    }
}

#Preview {
ConversationView()
}
