//
//  ChatBubble.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 18/10/23.
//

import SwiftUI

struct ChatBubble: Shape {
    //MARK: - Properties
    let isFromCurrentuser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [
                                    .topLeft,
                                    .topRight,
                                    isFromCurrentuser ? .bottomLeft : .bottomRight
                                ], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble( isFromCurrentuser: true )
}
