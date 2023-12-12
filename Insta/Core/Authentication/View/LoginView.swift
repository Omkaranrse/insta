//
//  LoginView.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var vm = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                //logo image
                Image("insta_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                //textFields
                VStack{
                    TextField("Phone number, username or email", text: $vm.email)
                        .textInputAutocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Password", text: $vm.password)
                        .modifier(IGTextFieldModifier())
                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button(action: {
                    Task{
                        try await vm.signIn()
                    }
                }, label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                .padding(.vertical)
                
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundStyle(Color.gray)
                
                HStack{
                    Image("Facebook_Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                HStack(spacing: 3){
                    Text("Don't have an account?")
                    
                    NavigationLink(
                        destination: AddEmailView()) {
                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                }
                .font(.footnote)
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
