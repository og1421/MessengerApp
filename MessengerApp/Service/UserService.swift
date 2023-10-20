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
    
    func fetchCurrentuser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("DEBUG: current user in service: \(currentUser)")
    }
    
    
}
