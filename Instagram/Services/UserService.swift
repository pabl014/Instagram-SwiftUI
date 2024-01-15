//
//  UserService.swift
//  Instagram
//
//  Created by Paweł Rudnik on 15/01/2024.
//

// global services that will be used among project

import Foundation
import Firebase

struct UserService {
    
    // static, so we dont have to initialize UserService() every single time we call a function on it
    static func fetchAllUsers() async throws -> [User] {
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments() // go to the user collection and get all documents,
                                                                                // and each of documents will return its own data set
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) }) // looking at all documents and then applying mapping function to each document
                                                                              // and turning the data of each document into a User
    }
    
    
}
