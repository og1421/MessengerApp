//
//  LoginView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 09/10/23.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - Properties
    @StateObject var viewModel = LoginVIewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                VStack(spacing: 22 ) {
                    
                    //text field
                    
                    TextField("Enter your email", text: $viewModel.email)
                        .font(.headline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                    
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .font(.headline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }
                
                //forgot password
                
                Button {
                    print("Forgot password")
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                //login button
                Button {
                    Task {
                        try await viewModel.login()
                    }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame( width: (UIScreen.main.bounds.width / 2 ) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame( width: (UIScreen.main.bounds.width / 2 ) - 40, height: 0.5)
                    
                }
                    .foregroundColor(.gray)
                
                VStack {
                    
                    //facebook logo
                    Button {
                        
                    } label: {
                        HStack {
                            Text("Sign in with Facebook")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                
                        }
                        .padding(.top, 8)
                    }
                    .frame(width: 360, height: 50)
                    .clipShape(Capsule())
                    .background(Color(.systemBlue))
                    .cornerRadius(15)
                    
                    // Google logo
                    Button{
                        
                    } label: {
                        HStack {
                            
                            Text("Sign in with Google")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                        }
                        .padding(.top, 8)
                    }
                    .frame(width: 360, height: 50)
                    .clipShape(Capsule())
                    .background(.red)
                    .cornerRadius(15)
                    
                    
                    //Apple logo
                    Button{
                        
                    } label: {
                        HStack {
                            
                            Text("Sign in with Apple")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 8)
                    }
                    .frame(width: 360, height: 50)
                    .clipShape(Capsule())
                    .background(.black)
                    .cornerRadius(15)
                }
                
                Spacer()
                
                Divider()
                
                // sign up link
                NavigationLink {
                    CreateAccountView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
