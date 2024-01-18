//
//  ProfileHeaderView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 12/01/2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile = false
    @State private var postCount = 0
    var body: some View {
        VStack(spacing: 10) {
            // profile picture and stats
            HStack {
                CircularProfileImageView(user: user, size: .large)
                
                Spacer()
                
                HStack(spacing: 8) {
                    Spacer()
                    UserStatView(value: postCount, title: "Posts")
                    Spacer()
//                    UserStatView(value: 5, title: "Followers")
//                    UserStatView(value: 7, title: "Following")
                }
            }
            .padding(.horizontal)
            //.padding(.bottom, 4)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                
                // if let instead of ' ?? ' to avoid blank spaces under the photo
                
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio{
                    Text(bio)
                        .font(.footnote)
                }

            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // edit profile button
            Button(action: {
                user.isCurrentUser ? showEditProfile.toggle() : print("Follow user")
            }, label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 42)
                    .background(user.isCurrentUser ? .white : .blue)
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                    )
            })
            
            Divider()
        }
        .onAppear {
            Task {
                let posts = try await PostService.fetchUserPosts(uid: user.id)
                postCount = posts.count
            }
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[2])
}
