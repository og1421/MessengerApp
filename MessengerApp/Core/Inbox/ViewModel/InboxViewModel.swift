//
//  InboxViewModel.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 20/10/23.
//

import Foundation
import Combine
import Firebase

@MainActor
class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()
    
    private var cancellables = Set<AnyCancellable>()
    private let service = InboxService()
    
    init() {
        setupSubscribers()
        service.observeRecentMessages()
    }
    
    @MainActor
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
        service.$documentChanges.sink { [weak self] changes in
            self?.loadInitialMessages(fromChanges: changes)
        }.store(in: &cancellables)
    }
    
    private func loadInitialMessages(fromChanges changes: [DocumentChange]) {
        var messages = changes.compactMap({ try? $0.document.data(as:Message.self) })
        
        for i in 0 ..< messages.count {
            let message = messages[i]
            
            UserService.fetchUser(withUid: message.chatPartnerId) { user in
                messages[i].user = user
                self.recentMessages.append(messages[i])
            }
        }
    }
    
    @MainActor
    func deleteItem (at offset: IndexSet) {
        guard let index = offset.first else  {
            return
        }
        
        guard let userID = currentUser?.uid else {
            print("Unable to retrieve current user id")
            return
        }
        
        guard let messageId = recentMessages[index].messageId else {
            print("Unable to retrieve the message id")
            return
            
        }
        
        print("DEBUG: o código do presente usuário é:  \(userID)")
        print("DEBUG: o código da mensagem a ser apagada é: \(messageId)")
        
        //TODO - deletar a mensagem do servidor
        
//        recentMessages.remove(atOffsets: offset)
        
        MessageService.deleteUserMessage(userID: userID, withId: messageId)
        MessageService.deleteUserMessage(userID: userID, withId: "recent-messages")
        
    }
}
