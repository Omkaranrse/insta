//
//  EditProfileView.swift
//  Insta
//
//  Created by Omkar Anarse on 10/12/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm : EditProfileViewModel
    
    init(user : User){
        self._vm = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            //toolbar
            VStack {
                HStack {
                    Button("Cancel"){
                        dismiss()
                    }
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        Task{ 
                            try await vm.updateUserData()
                            dismiss()
                        }
                    }, label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    })
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            //Edit profile Picture
            PhotosPicker(selection: $vm.selectedImage) {
                VStack(spacing: 8){
                    if let image = vm.profileImage {
                        image
                            .resizable()
                            .foregroundStyle(Color.white)
                            .background(Color.gray)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())

                    } else {
                        CircularProfileImageView(user: vm.user, size: .large)
                    }
                    
                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            
            //Edit profile info
            VStack{
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $vm.fullName)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $vm.bio)
              
                Spacer()
            }
            
        }
    }
}

struct EditProfileRowView : View {
    
    let title : String
    let placeholder : String
    @Binding var text : String
    
    var body: some View {
        HStack{
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack{
                TextField(placeholder, text: $text)
                
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
