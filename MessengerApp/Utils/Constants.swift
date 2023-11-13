//
//  Constants.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 21/10/23.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let db = Firestore.firestore()
    static let usersCollections = db.collection("users")
    static let messagesCollections = db.collection("messages")
}
