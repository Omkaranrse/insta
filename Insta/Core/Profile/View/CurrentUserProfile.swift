//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    private let imageDimension : CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    let user : User
    @State private var showEditProfile = false

    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    //header
                    VStack(spacing: 10) {
                        // pic and stats
                        HStack(alignment: .center, spacing: 35) {
                            
                            CircularProfileImageView(user: user, size: .large)
                            
                            HStack(alignment: .top, spacing: 0) {
                                
                                UsersStatView(value: "123", title: "Posts")
                                UsersStatView(value: "41.6K", title: "Followers")
                                UsersStatView(value: "323", title: "Following")
                            }
                            .padding(0)
                        }
                        .padding(0)
                        
                        //name and bio
                        VStack(alignment: .leading, spacing: 10) {
                            VStack(alignment: .leading, spacing: 6){
                                if let fullName = user.fullName{
                                    Text(fullName)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color.primary)
                                }
                                
                                if let bio = user.bio {
                                    Text(bio)
                                        .font(.footnote)
                                        .foregroundStyle(Color.primary)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 0)
                        
                        //action Button
                        HStack{
                            Button(action: {
                                if user.isCurrentUser {
                                    showEditProfile.toggle()
                                    print("edit profile...")
                                } else {
                                    print("Follow...")
                                }
                            }, label: {
                                Text(user.isCurrentUser ? "Edit profile" : "Follow")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(user.isCurrentUser ? Color.primary : .white)
                                    .frame(width: geometry.size.width / 2.2, height: 32)
                                    .background(user.isCurrentUser ? Color.gray.opacity(0.5) : Color.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                            })
                            Button(action: {}, label: {
                                Text("Share profile")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.primary)
                                    .frame(width: geometry.size.width / 2.2, height: 32)
                                    .background(Color.gray.opacity(0.5))
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                            })
                        }
                        .fullScreenCover(isPresented: $showEditProfile) {
                            EditProfileView(user: user)
                        }

                        
                        //Higlights
                        ScrollView(.horizontal) {
                            HStack(alignment: .top, spacing: 16) {
                                ForEach(0..<50) { _ in
                                    VStack {
                                        Image("green")
                                            .resizable()
                                            .frame(width: 62.5, height: 62.5)
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(Circle())
                                            .overlay {
                                                Circle()
                                                    .stroke(Color.red)
                                            }
                                        
                                        Text("Highlight 01")
                                            .font(Font.custom("SF Pro Text", size: 12))
                                            .multilineTextAlignment(.center)
                                            .foregroundStyle(Color.primary)
                                    }
                                    .frame(width: 66, height: 83)                                 }
                            }
                            .padding(.leading, 12)
                            
                        }
                        .scrollIndicators(.never)
                        
                    }
                    
                    //post grid view
                    PostGridView(user: user)
                }
                .frame(width: 393, height: 852)
                .scrollIndicators(.never)
            }
            .navigationTitle(user.userName ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem (placement: .topBarTrailing){
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "plus.app")
                        })
                        Button(action: {
                            AuthService.shared.signOut()
                        }, label: {
                            Image(systemName: "line.3.horizontal")
                        })
                    }
                }
                
            })

        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[1])
}
