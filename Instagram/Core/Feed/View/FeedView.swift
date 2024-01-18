//
//  FeedView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 11/01/2024.
//

import SwiftUI

struct FeedView: View {
    
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 30) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                  Image("instagram-text-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 32)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                  Image(systemName: "paperplane")
                        .imageScale(.large)
                       
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
