//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Omkar Anarse on 04/12/23.
//

import Foundation

class RegistrationViewModel : ObservableObject {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, userName: userName)
        
        userName = ""
        email = ""
        password = ""
    }
}
