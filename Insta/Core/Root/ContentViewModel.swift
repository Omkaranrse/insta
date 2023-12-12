//
//  ContentViewModel.swift
//  Instagram
//
//  Created by Omkar Anarse on 03/12/23.
//

import Foundation
import FirebaseAuth
import Combine


class ContentViewModel : ObservableObject {
    
    private let service = AuthService.shared
    private var canceellables = Set<AnyCancellable>()
    
    @Published var userSession : FirebaseAuth.User?
    @Published var currentUser : User?
    
    init(){
        setUpSubscribers()
    }
    
    func setUpSubscribers(){
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &canceellables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &canceellables)

    }
}
