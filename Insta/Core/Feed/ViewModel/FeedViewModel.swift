//
//  FeedViewModel.swift
//  Insta
//
//  Created by Omkar Anarse on 12/12/23.
//

import Foundation
import Firebase

class FeedViewModel : ObservableObject {
    
    @Published var posts = [Post]()
    
    init(){
        Task{ try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPost()
    }
}
