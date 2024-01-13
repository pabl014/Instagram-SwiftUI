//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Paweł Rudnik on 13/01/2024.
//

import SwiftUI
import Observation
import PhotosUI

@MainActor
final class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(fromItem: selectedImage)
            }
        }
    }
    
    @Published var postImage: Image?
    
    // looking at item we selected at photopicker
    func loadImage(fromItem item: PhotosPickerItem?) async {
        
        // checking if there is item to load
        guard let item else { return }
        
        // gets image data from the PhotoPicker item
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        self.postImage = Image(uiImage: uiImage)
        
    }
    
    
}
