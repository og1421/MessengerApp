//
//  ChatMessageCell.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 18/10/23.
//

import SwiftUI

struct ChatMessageCell: View {
    //MARK: - Properties
    let isFromCurrentUser: Bool
    
    //MARK: - View
    var body: some View {
        HStack {
            if isFromCurrentUser{
                Spacer()
                
                Text("This is a text message for me")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentuser: isFromCurrentUser))
                    .frame(minWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
                
            } else  {
                HStack (alignment: .bottom, spacing: 8){
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    
                    Text("This is a text message from user")
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentuser: isFromCurrentUser))
                        .frame(minWidth: UIScreen.main.bounds.width / 1.75, alignment: .trailing)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: false)
}
