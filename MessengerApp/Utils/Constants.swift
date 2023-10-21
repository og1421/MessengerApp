//
//  Constants.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 21/10/23.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let usersCollections = Firestore.firestore().collection("users")
    static let messagesCollections = Firestore.firestore().collection("messages")
}
