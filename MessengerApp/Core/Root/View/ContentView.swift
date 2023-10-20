//
//  ContentView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 09/10/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @StateObject var viewModel = ContentViewModel()
    
    //MARK: - View
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                InboxView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
