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
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
//        self.posts = try snapshot.documents.compactMap({ document in
//            let post = try document.data(as: Post.self)
//            return post
//        })
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            var postUser = try await UserService.fetchUser(withUid: ownerUid)
            self.posts[i].user = postUser
        }
    }
    
}
