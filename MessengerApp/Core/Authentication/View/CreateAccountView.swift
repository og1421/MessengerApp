//
//  CreateAccountView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 09/10/23.
//

import SwiftUI

struct CreateAccountView: View {
    
    //MARK: - Properties
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    
    @Environment (\.dismiss) var dismiss
    
    //MARK: - View
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 22 ) {
                
                //text field
                
                TextField("Enter your email", text: $email)
                    .font(.headline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                TextField("Enter your full name", text: $fullName)
                    .font(.headline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                
                
                SecureField("Enter your password", text: $password)
                    .font(.headline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
            }
            
            //login button
            Button {
                print("Handle Login")
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            // sign up link
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

//MARK: - Preview
#Preview {
    CreateAccountView()
}
