//
//  User.swift
//  Instagram
//
//  Created by Paweł Rudnik on 12/01/2024.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    
    let id: String
    var username: String
    var profileImageURl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
}

extension User {
    static let MOCK_USERS: [User] = [
        
        .init(id: NSUUID().uuidString, username: "dwight123", profileImageURl: nil, fullname: "Dwight Schrute", bio: "sralalalalalal" , email: "dwightschrute@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "szwagier15", profileImageURl: "szwagier", fullname: "Szwagier", bio: "tutu tutuuuu" , email: "szwagier@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "bohaternarodu", profileImageURl: "donaldinho", fullname: "Donaldinho Tuskinho", bio: nil , email: "donaldinhogaucho@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "franek21", profileImageURl: "tomasz-frankowski", fullname: "Tomasz Frankowski", bio: "franek lowca bramek" , email: "franeklowcabramek@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "pudzian99", profileImageURl: "pudzian", fullname: "Mariusz Pudzianowski", bio: "to by nic nie dalo i tak" , email: "pudzilla@gmail.com"),
        
        .init(id: NSUUID().uuidString, username: "macias(L)", profileImageURl: "macias", fullname: nil, bio: "buona sera seniorita" , email: "hejlegiodziekizawalke@gmail.com")
        
    ]
}
