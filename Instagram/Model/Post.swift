//
//  Post.swift
//  Instagram
//
//  Created by Paweł Rudnik on 12/01/2024.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable { // Hashable to make things navigatable (ex. we need .navigationDestination)
    
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp // Firebase does not support Date()
    var user: User?
    
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Micheal scott on the photo",
              likes: 125,
              imageUrl: "michael-shock", 
              timestamp: Timestamp(),
              user: User.MOCK_USERS[3]),
    
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Najlepszy napastnik z Polski",
              likes: 1456,
              imageUrl: "tomasz-frankowski",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[0]),
        
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Pozdrowienia dla wszystkich twitterowych hejterow",
              likes: 12534,
              imageUrl: "macias",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[2]),
        
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Ufam temu panu bardzo mocno",
              likes: 125,
              imageUrl: "donaldinho",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[4]),
        
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "siema szwagier a co ty tu kurcze robisz",
              likes: 125,
              imageUrl: "szwagier",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[5])
    
    
    ]
}
