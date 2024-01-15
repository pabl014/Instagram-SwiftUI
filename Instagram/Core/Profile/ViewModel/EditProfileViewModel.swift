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
    
    @Published var fullname = ""
    @Published var bio = ""
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var profileImage: Image?
    
    // looking at item we selected at photopicker
    func loadImage(fromItem item: PhotosPickerItem?) async {
        
        // checking if there is item to load
        guard let item else { return }
        
        // gets image data from the PhotoPicker item
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        self.profileImage = Image(uiImage: uiImage)
        
    }
}
