//
//  User.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import Foundation
import Firebase

struct User : Identifiable, Hashable, Codable {
    let id: String
    var userName : String?
    var bio : String?
    var fullName : String?
    var profilePicture : String?
    let email : String
    
    var isCurrentUser : Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS : [User] = [
        .init(id: UUID().uuidString, userName: "itzz__omiii_07",bio: "OMKAR ANARSË 💜 iOS Developer", fullName: "𓊈𒆜ØMKÃR𒆜𓊉",profilePicture: "Image", email: "omkar@gmail.com"),
        .init(id: UUID().uuidString, userName: "sahil_07",bio: "Web Developer", fullName: "Sahil bhai",profilePicture: "Star", email: "sahil@gmail.com"),
        .init(id: UUID().uuidString, userName: "instagram_00",bio: "Android Developer", fullName: "instagram",profilePicture: "iron man", email: "instagram@gmail.com"),
        .init(id: UUID().uuidString, userName: "yash_19",bio: "iOS Developer", fullName: nil,profilePicture: "captain", email: "yash@gmail.com"),
        .init(id: UUID().uuidString, userName: "pratham_88",bio: "Web Developer", fullName: "partham bhai",profilePicture: "iron22", email: "pratham@gmail.com")
    ]
}
