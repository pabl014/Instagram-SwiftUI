//
//  MainTabView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 11/01/2024.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem { Image(systemName: "house") }
            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
            Text("Upload Post")
                .tabItem { Image(systemName: "plus.app") }
            Text("Notifications")
                .tabItem { Image(systemName: "heart.fill") }
            CurrentUserProfileView(user: User.MOCK_USERS[1])
                .tabItem { Image(systemName: "person.fill") }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
