//
//  SettingsOptionsViewModel.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 13/10/23.
//

import SwiftUI

enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    
    var title: String {
        switch self {
        case .darkMode:
            return "Dark Mode"
        
        case .activeStatus :
            return "Active Status"
        
        case .accessibility:
            return "Accessibility"
            
        case .privacy:
            return "Privacy and Safety"
            
        case .notifications:
            return "Notifications"
        }
    }
    
    var imageName: String {
        switch self {
        case .darkMode:
            return "moon.circle.fill"
            
        case .activeStatus:
            return "message.badge.circle.fill"
            
        case .accessibility:
            return "person.circle.fill"
            
        case .privacy :
            return "lock.circle.fill"
            
        case .notifications:
            return "bell.circle.fill"
        }
    }
    
    var imageBackground: Color {
        switch self {
        case .darkMode:
            return .black
            
        case .activeStatus:
            return Color(.systemGreen)
            
        case .accessibility:
            return .black
            
        case .privacy :
            return Color(.systemBlue)
            
        case .notifications:
            return Color(.systemPurple)
        }
    }
    
    var id: Int { return self.rawValue }
}
