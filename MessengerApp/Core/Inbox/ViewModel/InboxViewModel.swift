//
//  InboxViewModel.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 20/10/23.
//

import Foundation
import Combine
import Firebase

@MainActor
class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    @MainActor
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
