//
//  ChatView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 17/10/23.
//

import SwiftUI

struct ChatView: View {
    //MARK: - Properties
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    //MARK: - View
    var body: some View {
        VStack {
            ScrollView{
                //header
                VStack {
                    CircularProfileImageView(user: user, size: .large)
                    
                    VStack (spacing: 4) {
                        Text(user.fullName)
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                
                //messages
                
                LazyVStack {
                    ForEach( viewModel.messages, id: \.self) { message in
                        ChatMessageCell(message: message)
                    }
                }
            }
        }
        
        Spacer()
        
        //message input view
        ZStack(alignment: .trailing) {
            TextField("Message...", text: $viewModel.messageText, axis: .vertical
            )
                .padding(12)
                .padding(.trailing, 40)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
            
            Button {
                viewModel.sendMessage()
                viewModel.messageText = ""
            } label: {
                Text("Send")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
                
        }
        .padding()
        .navigationTitle(user.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USER)
}
