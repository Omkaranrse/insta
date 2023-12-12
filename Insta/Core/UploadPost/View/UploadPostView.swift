//
//  UploadPostView.swift
//  Instagram
//
//  Created by Omkar Anarse on 03/12/23.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var vm = UploadPostViewModel()
    @Binding var tabIndex : Int
    
    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }
                
                Spacer()

                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task{
                        try await vm.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            
            // post image and caption
            HStack{
                if let image = vm.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()

                }
                            
                TextField("Enter your caption...",
                          text: $caption, axis: .vertical)
            }
            .padding()
            
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $vm.selectedImage)
    }
    
    func clearPostDataAndReturnToFeed(){
        caption = ""
        vm.selectedImage = nil
        vm.postImage = nil
        tabIndex = 0

    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
