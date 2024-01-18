//
//  UserStatView.swift
//  Instagram
//
//  Created by Paweł Rudnik on 11/01/2024.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    var title: String
    
    var body: some View {
        
        HStack {
            Text("\(value)")
                .font(.title)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.title)
                .font(.footnote)
        }
        .frame(width: 100)
    }
}

#Preview {
    UserStatView(value: 7, title: "Posts")
}
