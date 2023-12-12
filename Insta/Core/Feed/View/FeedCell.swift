//
//  FeedCell.swift
//  Instagram
//
//  Created by Omkar Anarse on 28/11/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    let post : Post
    
    var body: some View {
        VStack {
            //image + username
            HStack(alignment: .center, spacing: 200) {
            
                HStack(alignment: .center, spacing: 8) {
                    if let user = post.user {
                        CircularProfileImageView(user: user, size: .xSmall)                            .overlay(
                                Circle()
                                    .stroke(Color(red: 0.83, green: 0, blue: 0.77), lineWidth: 1.5)
                            )
                    }
                                        
                    VStack(alignment: .leading, spacing: 1) {
                        HStack(alignment: .center, spacing: 5) {
                            
                            if let user = post.user{
                                Text(user.userName ?? "")
                                    .font(
                                        Font.custom("SF Pro Text", size: 14)
                                            .weight(.semibold)
                                    )
                                    .foregroundStyle(Color.primary)
                            }
                            
                            
                            Image(systemName: "checkmark.seal.fill")
                                .frame(width: 10, height: 10)
                                .imageScale(.small)
                                .foregroundStyle(Color.blue)
                        }
                        .padding(0)
                        
                        Text("Location, Location")
                            .font(Font.custom("SF Pro Text", size: 12))
                            .foregroundStyle(Color.primary)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32, alignment: .topLeading)
                    
                    
                    
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis")
                    })
                    
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.leading, 8)
            .padding(.trailing, 14)
            .padding(.vertical, 8)
            .frame(width: 393, alignment: .leading)
            
            //post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 393, height: 393)
                .clipShape(Rectangle())
            
            //action buttons
            HStack{
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                })
                Button(action: {}, label: {
                    Image(systemName: "message")
                        .imageScale(.large)
                })
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "bookmark")
                        .imageScale(.large)
                })
            }
            .padding(.horizontal, 8)
            .padding(.top, 4)
            
            //likes label
            Text ("\(post.likes) likes")
                .font (.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            
            //caption label
            HStack{
                Text("\(post.user?.userName ?? "")").fontWeight(.semibold) +
                Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text ("6h ago")
                .font (.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POST[3])
}
