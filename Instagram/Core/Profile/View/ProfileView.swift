//
//  ProfileView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 11/01/2024.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User

//    var posts: [Post] {
//        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
//    }
//    
    var body: some View {
        //NavigationStack {
            ScrollView {
                VStack {
                    // Header:
                    ProfileHeaderView(user: user)
                    
                    // Post grid view
                    
                    PostGridView(user: user)
                    
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        //}
        
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[2])
}
