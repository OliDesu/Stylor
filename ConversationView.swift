//
//  ConversationView.swift
//  Stylor
//
//  Created by Ali El Mufti on 17/09/2024.
//

import SwiftUI



struct ConversationView: View {
    @State private var messages: [Message] = [
        Message(text: "Hello!", isSentByUser: false),
        Message(text: "Hi there!", isSentByUser: true)
    ]
    @State private var inputMessage: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack(spacing: 10) {
                        ForEach(messages) { message in
                            HStack {
                                if message.isSentByUser {
                                    Spacer()
                                    Text(message.text)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                        .frame(maxWidth: 250, alignment: .trailing)
                                } else {
                                    Text(message.text)
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
                        scrollView.scrollTo(messages.last?.id, anchor: .bottom)
                    }
                    .onChange(of: messages) { _ in
                        scrollView.scrollTo(messages.last?.id, anchor: .bottom)
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
            let newMessage = Message(text: inputMessage, isSentByUser: true)
            messages.append(newMessage)
            inputMessage = ""
        }
    }
}

#Preview
struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
