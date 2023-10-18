//
//  ChatView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 17/10/23.
//

import SwiftUI

struct ChatView: View {
    //MARK: - Properties
    @State private var messageText = ""
    
    //MARK: - View
    var body: some View {
        VStack {
            ScrollView{
                //header
                VStack {
                    CircularProfileImageView(user: User.MOCK_USER, size: .large)
                    
                    VStack (spacing: 4) {
                        Text("Bruce Wayne")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                
                //messages
                
                ForEach( 0 ... 15, id: \.self) { message in
                    ChatMessageCell(isFromCurrentUser: Bool.random())
                }
                
            }
        }
        
        Spacer()
        
        //message input view
        ZStack(alignment: .trailing) {
            TextField("Message...", text: $messageText, axis: .vertical
            )
                .padding(12)
                .padding(.trailing, 40)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
                .font(.subheadline)
            
            Button {
                print("send message")
            } label: {
                Text("Send")
                    .fontWeight(.semibold)
            }
            .padding(.horizontal)
                
        }
        .padding()
    }
}

#Preview {
    ChatView()
}
