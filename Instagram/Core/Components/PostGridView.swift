//
//  PostGridView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 12/01/2024.
//

import SwiftUI

struct PostGridView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = UIScreen.main.bounds.width / 3 - 1
    
    var posts: [Post]
    
    var body: some View {
        
        LazyVGrid(columns: gridItems, spacing: 2) {
            
            ForEach(posts) { post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
            
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}
