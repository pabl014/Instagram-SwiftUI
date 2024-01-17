//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Paweł Rudnik on 13/01/2024.
//

import SwiftUI
import PhotosUI
import Firebase

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
    private var uiImage: UIImage?
    
    // looking at item we selected at photopicker
    func loadImage(fromItem item: PhotosPickerItem?) async {
        
        // checking if there is item to load
        guard let item else { return }
        
        // gets image data from the PhotoPicker item
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
        
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return } // upload an image before we try to upload our post
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp()) // create Post object (Timestamp() -> time at the moment of uploading )
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return } // encode post
        
        try await postRef.setData(encodedPost) // upload to Firestore
    }
    
}
