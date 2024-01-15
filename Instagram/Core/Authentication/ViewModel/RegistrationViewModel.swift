//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Paweł Rudnik on 14/01/2024.
//

import Foundation

final class RegistrationViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        email = ""
        password = ""
        username = ""
    }
}
