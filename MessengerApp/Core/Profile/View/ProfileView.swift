//
//  ProfileView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 13/10/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //header
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(.systemGray4))
                
                Text("Bruce Wayne")
                    .font(.title2)
                    .fontWeight(.semibold)
                
            }
            
            //list
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases ) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackground)
                            
                            Text(option.title)
                                .font(.subheadline)
                            
                        }
                    }
                }
                
                Section {
                    Button( "Log Out") {
                        
                    }
                    
                    Button( "Delete Account") {
                        
                    }
                }
                .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    ProfileView()
}
