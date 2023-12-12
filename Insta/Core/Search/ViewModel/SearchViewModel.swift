//
//  SearchViewModel.swift
//  Insta
//
//  Created by Omkar Anarse on 09/12/23.
//

import Foundation

class SearchViewModel : ObservableObject {
    
    @Published var users = [User]()
    
    init(){
        Task{ try await fetchAllUser() }
    }
    
    @MainActor
    func fetchAllUser() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
