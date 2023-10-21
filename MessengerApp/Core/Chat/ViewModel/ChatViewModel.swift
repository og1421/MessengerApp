//
//  ChatViewModel.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 21/10/23.
//

import Foundation

class ChatViewModel: ObservableObject {
    //MARK: - Properties
    @Published var messageText = ""
    @Published var messages = [Message]()
    
    let service: ChatService
    
    init(user: User) {
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages() {
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage() {
        service.sendMessage(messageText)
    }
}
