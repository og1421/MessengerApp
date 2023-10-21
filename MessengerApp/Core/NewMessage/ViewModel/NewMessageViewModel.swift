//
//  NewMessageViewModel.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 21/10/23.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter({ $0.id != currentUid})
    }
}
