//
//  UserService.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 20/10/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class UserService {
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentuser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
    }
    
    static func fetchAllUsers(limit: Int? = nil) async throws -> [User] {
        let query = FirestoreConstants.usersCollections
        
        if let limit {
            query.limit(to: limit)
        }
        
        let snapshot = try await query.getDocuments()
        let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
        
        return users
    }
    
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        FirestoreConstants.usersCollections.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            
            completion(user)
        }
    }
    
}
