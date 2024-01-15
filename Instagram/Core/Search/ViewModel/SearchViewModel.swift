//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Paweł Rudnik on 15/01/2024.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
    
    
}
