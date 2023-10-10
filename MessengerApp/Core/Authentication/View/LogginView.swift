//
//  LoginView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 09/10/23.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - Properties
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            TextField("", text: $email)
                .background(.red)
            
            TextField("", text: $password)
                .background(.blue)
            
            Button {
                
            } label: {
                Text("Forgot Password?")
            }
            
            Button {
                
            } label: {
                Text("Login")
            }
            
            Spacer()
            
            
            
            Button {
                
            } label: {
                Text("Don't have an account? Sign Up")
            }
            
        }
    }
}

#Preview {
    LoginView()
}
