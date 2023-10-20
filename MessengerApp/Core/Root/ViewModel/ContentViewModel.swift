//
//  ContentViewModel.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 19/10/23.
//

import Firebase
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self ] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
    }
}
