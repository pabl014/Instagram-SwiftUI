//
//  PostGridView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 12/01/2024.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    @StateObject var viewModel: PostGridViewModel // don't want to initialize it because we need to pass user in
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
        // state object with an initialization
        // we need that user parameter inside PostGridViewModel so that we can set the post user object on our PostGridView
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = UIScreen.main.bounds.width / 3 - 1
    
    
    var body: some View {
        
        LazyVGrid(columns: gridItems, spacing: 2) {
            
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
            
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS[2])
}
