//
//  ContentViewModel.swift
//  Instagram
//
//  Created by Paweł Rudnik on 13/01/2024.
//

import Foundation
import FirebaseAuth
import Combine

final class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        setupSubscribers()
    }
    
    func setupSubscribers() {
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
            
        
    }
}
