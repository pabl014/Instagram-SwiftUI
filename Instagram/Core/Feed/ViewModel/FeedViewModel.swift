//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Paweł Rudnik on 18/01/2024.
//

import Foundation
import Firebase

// fetching posts from database and then populating feed view with posts

// Working with optionals can be annoying, but compactMap() can make life much easier: it performs a transformation (the “map” part of its name), but then unwraps all the optionals and discards any that are nil.
@MainActor
final class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    init(){
        Task {
            try await fetchPosts()
        }
    }
    
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
    
}
