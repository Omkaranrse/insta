//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Omkar Anarse on 04/12/23.
//

import Foundation

class LoginViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
