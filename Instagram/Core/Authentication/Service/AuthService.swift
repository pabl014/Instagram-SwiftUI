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
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    @Published var userSession: FirebaseAuth.User? // userSession is used to determine if we have user logged in or not
    
    static let shared = AuthService() 
    
    init() {
        self.userSession = Auth.auth().currentUser // code from firebase -> it's going to perform some sort of check to see if we have a user logged in to our app
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to log in with error: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password) // create user in backend with the authentication service
            self.userSession = result.user                                                      // set user session
            print("DEBUG: Did create user")
            await uploadUserData(uid: result.user.uid, username: username, email: email)        // upload user data
            print("DEBUG: Did upload user data")
        } catch {
            print("DEBUG: Failed to register user with error: \(error.localizedDescription)")
        }

    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return } // transform user into data dictionary in firebase
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        
    }
}
