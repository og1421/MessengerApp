//
//  ChatService.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 21/10/23.
//

import Foundation
import Firebase
import FirebaseAuth

struct ChatService {
    
    let chatPartner: User
    
    func sendMessage(_ messageText: String ) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerId = chatPartner.id
        
        let currentUserRef = FirestoreConstants.messagesCollections.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = FirestoreConstants.messagesCollections.document(chatPartnerId).collection(currentUid)
        
        let recentCurrentUserRef = FirestoreConstants.messagesCollections.document(currentUid).collection("recent-messages").document(chatPartnerId)
        let recentPartnerResf = FirestoreConstants.messagesCollections.document(chatPartnerId).collection("recent-messages").document(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(messageId: messageId,
                              fromId: currentUid,
                              toId: chatPartnerId,
                              messageText: messageText,
                              timeStamp: Timestamp()
        )
        
        guard let messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
        
        recentCurrentUserRef.setData(messageData)
        recentPartnerResf.setData(messageData)
    }
    
    func observeMessages (completion: @escaping ([Message]) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let chatPartnerld = chatPartner.id
        
        let query = FirestoreConstants.messagesCollections
            .document (currentUid)
            .collection(chatPartnerld)
            .order (by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            var messages = changes.compactMap({ try? $0.document.data(as: Message.self) })
            
            for (index, message) in messages.enumerated() where !message.isFromCurrentUser {
                messages[index].user = chatPartner
            }
            
            completion (messages)
        }
    }
}
