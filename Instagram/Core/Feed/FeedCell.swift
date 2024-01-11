//
//  FeedCell.swift
//  Instagram
//
//  Created by Paweł Rudnik on 11/01/2024.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            
            // profile picture and name
            HStack {
                Image("michael-shock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("Michael Scott")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading,8)
            
            // post image
            
            Image("michael-shock")
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // like, comment, share
            HStack(spacing: 15) {
                
                Button{
                    print("like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                    
                }
                
                Button{
                    print("comment on post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button{
                    print("share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .tint(.black)
            
            // number of likes
            
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // caption label
            
            HStack {
                Text("Michael ")
                    .fontWeight(.semibold)
                + Text("This is some captions text for test. Blah blah blah. Blah blah blah. Blah blah blah.Blah blah blah.Blah blah blah.")
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
    FeedCell()
}
