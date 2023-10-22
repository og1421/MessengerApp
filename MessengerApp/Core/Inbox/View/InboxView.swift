//
//  InboxView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 12/10/23.
//

import SwiftUI

struct InboxView: View {
    
    //MARK: - Properties
    @State private var showNewMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    //MARK: - View
    var body: some View {
        NavigationStack {
            List {
                ActiveNowView()
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                ForEach ( viewModel.recentMessages ) { message in
                    ZStack {
                        NavigationLink(value: message) {
                            EmptyView()
                        }
                        .opacity(0.0)
                        
                        InboxRowView(message: message)
                    }
                }
            }
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(PlainListStyle())
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user {
                    ChatView(user: user)
                }
            })
            .navigationDestination(for: Route.self, destination: { route in
                switch route {
                case .profile(let user):
                    ProfileView(user: user)
                case .chatView(let user):
                    ChatView(user: user)
                }
            })
            .onChange(of: selectedUser, perform:  { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showNewMessageView) {
                NewMessageView(selectedUser: $selectedUser)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if let user {
                        HStack {
                            NavigationLink(value: Route.profile(user)) {
                                CircularProfileImageView(user: user, size: .xSmall)
                            
                            }
                            
                            Text("Chats")
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    }
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                        selectedUser = nil
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
