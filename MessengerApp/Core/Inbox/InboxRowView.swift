//
//  InboxRowView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 12/10/23.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .foregroundColor(Color(.systemGray4))
            
            VStack (alignment: .leading) {
                Text("Heath Ledger")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Some test message for now")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100 , alignment: .leading)
            }
            
            HStack {
                Text("Yesterday")
                
                Image(systemName: "chevron.right")
                
            }
            .font(.footnote)
            .foregroundColor(.gray)
            
        }
        .frame(height: 72)
    }
}

#Preview {
    InboxRowView()
}
