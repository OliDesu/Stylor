//
//  ChatView.swift
//  Stylor
//
//  Created by Ali El Mufti on 30/08/2024.
//

import SwiftUI

struct ChatView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ChatViewController {
        return ChatViewController()
    }

    func updateUIViewController(_ uiViewController: ChatViewController, context: Context) {
        // Perform any updates if necessary
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


#Preview {
    ChatView()
}
