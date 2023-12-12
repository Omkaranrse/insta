//
//  Post.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import Foundation
import Firebase

struct Post : Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption : String
    var likes : Int
    let imageUrl : String
    let timeStamp : Timestamp
    var user : User?
}

extension Post {
    static var MOCK_POST : [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is the caption for the image1!",
            likes: 103,
            imageUrl: "Star",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[0]
        ),
        
        .init(
            id: NSUUID().uuidString, 
            ownerUid: NSUUID().uuidString,
            caption: "This is the caption for the image2!",
            likes: 103,
            imageUrl: "captain",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[1]
        ),
        
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is the caption for the image3!",
            likes: 103,
            imageUrl: "iron22",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[2]
        ),
        
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is the caption for the image4!",
            likes: 103,
            imageUrl: "iron",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[3]
        ),
        
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is the caption for the image5!",
            likes: 103,
            imageUrl: "imagee",
            timeStamp: Timestamp(),
            user: User.MOCK_USERS[4]
        ),
    ]
}
