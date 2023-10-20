//
//  RegistrationViewModel.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 19/10/23.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    //MARK: - Properties
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName)
    }
}
