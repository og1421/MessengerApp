//
//  MessageService.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 21/10/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

struct MessageService {
    
    static let shared = MessageService()
    
    static func deleteUserMessage(userID: String, withId messageId: String) {
        let collectionRef = FirestoreConstants.messagesCollections.document(userID).collection(messageId)
        
        collectionRef.getDocuments { snapshot, error in
            if let error = error {
                print("Failed to get message documents: \(error.localizedDescription)")
                return
                
            }
            
            for document in snapshot!.documents {
                let documentRef = collectionRef.document(document.documentID)
                
                documentRef.delete { error in
                    if let error = error {
                        print("Unable to delete message: \(error.localizedDescription)")
                    } 
                }
            }
        }
    }
   
}
