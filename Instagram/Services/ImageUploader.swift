//
//  ImageUploader.swift
//  Instagram
//
//  Created by Paweł Rudnik on 16/01/2024.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    
    
    // sending image data to Firebase Storage and returning url of an image so it can be used for displaying in UI
    
    static func uploadImage(image: UIImage) async throws -> String? {
        // grabbing image data of an image object, needed for uploading to Firebase
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString                                                      // we want to give each one of images its own unique identifier
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")          // reference to the firebase storage
        
        do {
            let _  = try await ref.putDataAsync(imageData)          // sends image data to Firebase Storage (we don't need a return value from this putDataAsync(), so _ )
            let url = try await ref.downloadURL()                   // downloads image url
            return url.absoluteString                               // returns url as string
        } catch {
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
