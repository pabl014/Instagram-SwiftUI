//
//  ProfileView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 11/01/2024.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Header:
                    VStack(spacing: 10) {
                        // profile picture and stats
                        HStack {
                            Image("michael-scott")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Spacer()
                            
                            HStack(spacing: 8) {
                                UserStatView(value: 3, title: "Posts")
                                UserStatView(value: 5, title: "Followers")
                                UserStatView(value: 7, title: "Following")
                            }
                        }
                        .padding(.horizontal)
                        //.padding(.bottom, 4)
                        
                        // name and bio
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Name Surname")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Bio will be here")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        // edit profile button
                        Button(action: {
                            
                        }, label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 360, height: 42)
                                .foregroundColor(.black)
                                .overlay(RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                                )
                        })
                        
                        Divider()
                    }
                    // Post grid view
                    
                    LazyVGrid(columns: gridItems, spacing: 2) {
                        
                        ForEach(0 ... 15, id: \.self ) { index in
                            Image("michael-shock")
                                .resizable()
                                .scaledToFill()
                                //.frame(width: 80, height: 80)
                        }
                        
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.black)
                    }
                }
            }
        }
        
    }
}

#Preview {
    ProfileView()
}
