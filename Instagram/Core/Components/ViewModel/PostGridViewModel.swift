//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Paweł Rudnik on 18/01/2024.
//

import Foundation

final class PostGridViewModel: ObservableObject {
    
    private var user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        
        Task {
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
