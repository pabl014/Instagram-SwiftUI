//
//  AuthService.swift
//  Instagram
//
//  Created by Paweł Rudnik on 13/01/2024.
//

// all functions that are related to authenticating our user
// and communicating with our API to do that

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User? // userSession is used to determine if we have user logged in or not
    
    static let shared = AuthService() 
    
    init() {
        self.userSession = Auth.auth().currentUser // code from firebase -> it's going to perform some sort of check to see if we have a user logged in to our app
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        
    }
}
