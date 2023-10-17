//
//  ProfileView.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 13/10/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    //MARK: - Properties
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    
    
    //MARK: - View
    var body: some View {
        VStack {
            //header
            VStack {
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                    } else {
                        Image(user.profileImageUrl ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())

                    }
                }
                
                Text(user.fullName)
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
    ProfileView(user: User.MOCK_USER)
}
