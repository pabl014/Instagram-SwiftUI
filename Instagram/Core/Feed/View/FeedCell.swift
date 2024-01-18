//
//  FeedCell.swift
//  Instagram
//
//  Created by Paweł Rudnik on 11/01/2024.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    @StateObject var viewModel = FeedViewModel()
    var post: Post
    
    var body: some View {
        VStack {
            
            // profile picture and name
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                    
                    Text(user.fullname ?? user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.leading,8)
            
            // post image
            
            KFImage(URL(string:post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // like, comment, share
//            HStack(spacing: 15) {
//                
//                Button{
//                    print("like post")
//                } label: {
//                    Image(systemName: "heart")
//                        .imageScale(.large)
//                    
//                }
//                
//                Button{
//                    print("comment on post")
//                } label: {
//                    Image(systemName: "bubble.right")
//                        .imageScale(.large)
//                }
//                
//                Button{
//                    print("share post")
//                } label: {
//                    Image(systemName: "paperplane")
//                        .imageScale(.large)
//                }
//                
//                Spacer()
//            }
//            .padding(.leading, 8)
//            .padding(.top, 4)
//            .tint(.black)
            
            // number of likes
//            
//            Text("\(post.likes) likes")
//                .font(.footnote)
//                .fontWeight(.semibold)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.leading, 10)
//                .padding(.top, 1)
            
            // caption label
            
            HStack {
                if let user = post.user {
                    Text("\(user.fullname ?? user.username) ")
                        .fontWeight(.semibold)
                    + Text(post.caption)
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            // timestamp label:
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .tint(.gray)
                .padding(.leading, 10)
                .padding(.top, 1)
            
        }
    }
    
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[2])
}
