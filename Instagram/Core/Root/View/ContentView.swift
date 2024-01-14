//
//  ContentView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 13/01/2024.
//

import SwiftUI

// root view of a project

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil { // we dont have a logged in user, and we want to show the LoginView()
                LoginView()
                    .environmentObject(registrationViewModel)
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
