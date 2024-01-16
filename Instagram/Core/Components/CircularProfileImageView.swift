//
//  CircularProfileImageView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 16/01/2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
            
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}



struct CircularProfileImageView: View {
    var user: User
    let size: ProfileImageSize
    
    var body: some View {
        
        if let imageUrl = user.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
//                .onAppear {
//                    print("image uploaded with imageurl: \(imageUrl) ")
//                }
        } else {
            Image("image-placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        }
    
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USERS[2], size: .large)
}
