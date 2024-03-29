//
//  User.swift
//  Instagram
//
//  Created by Paweł Rudnik on 12/01/2024.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false } // Let's look at the currently logged in user's id, if there isn't one return false.
        return currentUid == id                // If the current user id is equal to that id then we know it is the current user,
                                               // that we're logged in as.
    }
    
}

extension User {
    static let MOCK_USERS: [User] = [
        
        .init(id: NSUUID().uuidString, username: "dwight123", profileImageUrl: nil, fullname: "Dwight Schrute", bio: "sralalalalalal" , email: "dwightschrute@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "szwagier15", profileImageUrl: nil, fullname: "Szwagier", bio: "tutu tutuuuu" , email: "szwagier@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "bohaternarodu", profileImageUrl: nil, fullname: "Donaldinho Tuskinho", bio: nil , email: "donaldinhogaucho@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "franek21", profileImageUrl: nil, fullname: "Tomasz Frankowski", bio: "franek lowca bramek" , email: "franeklowcabramek@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "pudzian99", profileImageUrl: nil, fullname: "Mariusz Pudzianowski", bio: "to by nic nie dalo i tak" , email: "pudzilla@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "macias(L)", profileImageUrl: nil, fullname: nil, bio: "buona sera seniorita" , email: "hejlegiodziekizawalke@gmail.com")
        
    ]
}
