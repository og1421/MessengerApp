//
//  LoginVIewModel.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 19/10/23.
//

import SwiftUI

class LoginVIewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws{
        try await AuthService().login(withEmail: email, password: password)
    }
}
