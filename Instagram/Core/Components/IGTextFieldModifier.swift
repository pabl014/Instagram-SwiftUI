//
//  IGTextFieldModifier.swift
//  Instagram
//
//  Created by Paweł Rudnik on 11/01/2024.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}
