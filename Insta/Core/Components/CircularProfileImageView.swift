//
//  CircularProfileImageView.swift
//  Insta
//
//  Created by Omkar Anarse on 12/12/23.
//

import SwiftUI
import Kingfisher
import Firebase
import FirebaseStorage

enum ProfileImageSize{
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}

struct CircularProfileImageView: View {
    
    let user : User
    let size : ProfileImageSize
    
    var body: some View {
        if let imageUrl = user.profilePicture {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(user: User.MOCK_USERS[2], size: .large)
}
