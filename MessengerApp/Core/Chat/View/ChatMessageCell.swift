//
//  ChatMessageCell.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 18/10/23.
//

import SwiftUI

struct ChatMessageCell: View {
    //MARK: - Properties
    let message: Message
    
    private var isFromCurrentUser: Bool {
        return message.isFromCurrentUser
    }
    
    //MARK: - View
    var body: some View {
        HStack {
            if isFromCurrentUser{
                Spacer()
                
                Text(message.messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentuser: isFromCurrentUser))
                    .frame(minWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
                
            } else  {
                HStack (alignment: .bottom, spacing: 8){
                    CircularProfileImageView(user: message.user, size: .xxSmall)
                    
                    Text(message.messageText)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentuser: isFromCurrentUser))
                        .frame(minWidth: UIScreen.main.bounds.width / 1.5, alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

//#Preview {
//    ChatMessageCell(isFromCurrentUser: false)
//}
