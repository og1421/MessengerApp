//
//  NewMessageView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 13/10/23.
//

import SwiftUI

struct NewMessageView: View {
    
    //MARK: - Properties
    @State private var searchText = ""
    @StateObject private var viewModel  = NewMessageViewModel()
    @Environment(\.dismiss) var dismiss
    
    //MARK: - View
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACTS")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach (viewModel.users) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: user, size: .small)
                            
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading, 40)
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                    
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewMessageView()
    }
}
