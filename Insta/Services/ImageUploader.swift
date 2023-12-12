//
//  ImageUploader.swift
//  Insta
//
//  Created by Omkar Anarse on 10/12/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func imageData(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/Profile_images/\(filename)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch  {
            print("DEBUG: Failed to upload image with error \(error.localizedDescription)")
            return nil
        }
    }
}
