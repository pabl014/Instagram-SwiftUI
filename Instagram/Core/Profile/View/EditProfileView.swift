//
//  EditProfileView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 15/01/2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @StateObject var viewModel = EditProfileViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            // toolbar
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    
                    Spacer()
                    
                    Text("Edit profile")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Done")
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            // edit profile pic
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .foregroundStyle(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    }
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            // edit profile info
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
                
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
            }
            
           Spacer()
        }
        
    }
    
}


struct EditProfileRowView: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileView()
}
