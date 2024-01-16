//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Paweł Rudnik on 15/01/2024.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
final class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    @Published var fullname = ""
    @Published var bio = ""
    
    @Published var profileImage: Image?
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    init(user: User) {
        self.user = user
    }
    
    // looking at item we selected at photopicker
    func loadImage(fromItem item: PhotosPickerItem?) async {
        
        // checking if there is item to load
        guard let item else { return }
        
        // gets image data from the PhotoPicker item
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    func updateUserData() async throws {
        // update profile image if changed
        
        var data = [String: Any]()
        
        // update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            user.fullname = fullname
            data["fullname"] = fullname
        }
        
        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
            user.bio = bio
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
