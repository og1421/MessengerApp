//
//  AuthService.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 19/10/23.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    
    //MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session id is \(userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
        } catch {
            print("DEBUG: failed to sign in user with error: \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
        } catch {
            print("DEBUG: failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
}
