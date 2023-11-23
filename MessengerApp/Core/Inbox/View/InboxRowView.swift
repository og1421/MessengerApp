//
//  InboxRowView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 12/10/23.
//

import SwiftUI

struct InboxRowView: View {
    //MARK: - Properties
    let message: Message
    let newMessages: Int
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: message.user, size: .medium)
            
            VStack (alignment: .leading) {
                Text(message.user?.fullName ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100 , alignment: .leading)
            }
            
            VStack{
                HStack {
                    Text(message.timestampString)
                    
                    Image(systemName: "chevron.right")
                    
                }
                .font(.footnote)
                .foregroundColor(.gray)
                
                if newMessages > 0 {
                    ZStack{
                        Circle()
                            .fill(.green)
                            .frame(width: 18, height: 18)
                        
                        Text("\(newMessages)")
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                }
            }
            
        }
        .frame(height: 72)
    }
}

//#Preview {
//    InboxRowView()
//}
