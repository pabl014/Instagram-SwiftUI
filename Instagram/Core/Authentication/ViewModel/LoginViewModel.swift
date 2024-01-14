//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Paweł Rudnik on 14/01/2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
