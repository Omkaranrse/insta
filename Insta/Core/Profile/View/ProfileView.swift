//
//  ProfileView.swift
//  Instagram
//
//  Created by Omkar Anarse on 23/11/23.
//

import SwiftUI



struct ProfileView: View {
    
    
    
    private let gridItems : [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        ScrollView {
            HStack(alignment: .top, spacing: 16) {
                ForEach(0..<50) { _ in
                    VStack {
                        Image("Star")
                            .resizable()
                            .frame(width: 62.5, height: 62.5)
                            .aspectRatio(contentMode: .fit)

                        Text("Highlight 01")
                            .font(Font.custom("SF Pro Text", size: 12))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.primary)
                    }
                    .frame(width: 66, height: 83)
                }
            }
            .padding(.leading, 12)
            .padding(.trailing, 0)
            .padding(.vertical, 0)
            .frame(width: 393, alignment: .topLeading)
        }


//                GeometryReader { geometry in
//                    ScrollView {
//                        //header
//                        VStack(spacing: 10){
//                            //pic and stats
//                            HStack{
//                                Image("ProfileImage")
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 80, height: 80)
//                                    .clipShape(Circle())
//
//                                Spacer()
//
//                                HStack(spacing: 8){
//                                    UsersStatView(value: "0", title: "Posts")
//                                    UsersStatView(value: "100", title: "Followers")
//                                    UsersStatView(value: "200", title: "Following")
//                                }
//                            }
//                            .padding(.horizontal,6)
//
//                            //name and bio
//                            VStack(alignment: .leading, spacing: 6){
//                                Text("𓊈𒆜ØMKÃR𒆜𓊉")
//                                    .font(.footnote)
//                                    .fontWeight(.semibold)
//                                Text("OMKAR ANARSË 💜")
//                                    .font(.footnote)
//                            }
//                            .frame(maxWidth: .infinity, alignment: .leading)
//
//                            //action button
//                            HStack{
//                                Button(action: {}, label: {
//                                    Text("Edit profile")
//                                        .font(.subheadline)
//                                        .fontWeight(.semibold)
//                                        .foregroundStyle(Color.primary)
//                                        .frame(width: geometry.size.width / 2.2, height: 32)
//                                        .background(Color.gray.opacity(0.5))
//                                        .clipShape(RoundedRectangle(cornerRadius: 6))
//                                })
//                                Spacer()
//                                Button(action: {}, label: {
//                                    Text("Share profile")
//                                        .font(.subheadline)
//                                        .fontWeight(.semibold)
//                                        .foregroundStyle(Color.primary)
//                                        .frame(width: geometry.size.width / 2.2, height: 32)
//                                        .background(Color.gray.opacity(0.5))
//                                        .clipShape(RoundedRectangle(cornerRadius: 6))
//                                })
//                            }
//
//
//
//                            Divider()
//                        }.padding()
//
//                        //post grid view
//
//                        LazyVGrid(columns: gridItems, content: {
//                            ForEach(0...15, id: \.self) { index in
//                                Image("Star")
//                                    .resizable()
//                                    .scaledToFill()
//                            }
//
//                        })
//                    }
//                }
        
        }
    
}

#Preview {
    ProfileView()
}
