//
//  User.swift
//  MessengerApp
//
//  Created by Orlando Moraes Martins on 16/10/23.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullName: String
    let email: String
    let profileImageUrl: String?
    
}


extension User {
    static let MOCK_USER = User(fullName: "Bruce Wayne", email: "batman@gmail.com", profileImageUrl: "batman")
    
}
