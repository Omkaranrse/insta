//
//  EditProfileViewModel.swift
//  Insta
//
//  Created by Omkar Anarse on 10/12/23.
//

import PhotosUI
import Firebase
import SwiftUI
import FirebaseStorage
import UIKit
import FirebaseCore

@MainActor
class EditProfileViewModel : ObservableObject {
    
    @Published var user : User
    
    @Published var selectedImage : PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage : Image?
    
    @Published var fullName  = ""
    @Published var bio  = ""
    
    private var uiImage : UIImage?

    init(user : User){
        self.user = user
        
        if let fullName = user.fullName {
            self.fullName = fullName
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item :  PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        
        //update profile pic if changed
        var data = [String : Any]()
        
        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.imageData(image: uiImage)
            data["profilePicture"] = imageUrl
        }
        
        //update profile name if changed
        if !fullName.isEmpty && user.fullName != fullName {
            data["fullName"] = fullName
        }
        
        //update profile bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty{
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
