//
//  PostGridView.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    @StateObject var vm : PostGridViewModel
    
    init(user: User){
        self._vm = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let imageDimension : CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    private let gridItems : [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2, content: {
            ForEach(vm.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
                
            }
        })
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS[0])
}
