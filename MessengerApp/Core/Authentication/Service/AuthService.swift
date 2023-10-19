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
    
    func login(withEmail email: String, password: String) async throws {
        print("DEBUG: Email is \(email) Password is \(password)")
    }
    
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: Created user \(result.user.uid)")
            
        } catch {
            print("DEBUG: failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    
}
