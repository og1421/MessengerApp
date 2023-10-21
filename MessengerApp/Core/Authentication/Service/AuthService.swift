//
//  AuthService.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 19/10/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

class AuthService {
    
    //MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        loadCurrentUserData()
        
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUserData()
        } catch {
            print("DEBUG: failed to sign in user with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullName: fullName, id: result.user.uid)
            loadCurrentUserData()
        } catch {
            print("DEBUG: failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() //sign out on backend
            self.userSession = nil //updates routing logic
            UserService.shared.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(email: String, fullName: String, id: String) async throws {
        let user = User(fullName: fullName, email: email, profileImageUrl: nil)
        
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return  }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
        
    }
    
    private func loadCurrentUserData() {
        Task { try await UserService.shared.fetchCurrentuser() }
    }
}
