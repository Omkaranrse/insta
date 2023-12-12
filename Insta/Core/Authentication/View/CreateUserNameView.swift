//
//  CreateUserNameView.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import SwiftUI

struct CreateUserNameView: View {
   
   @EnvironmentObject var vm : RegistrationViewModel
   
   var body: some View {
       VStack(spacing: 12) {
           Text("Create username")
               .font(.title2)
               .fontWeight(.bold)
               .padding(.top)
           
           Text("Pick a username for your new account. You can always change it later 💯")
               .font(.footnote)
               .foregroundStyle(Color.gray)
               .multilineTextAlignment(.center)
               .padding(.horizontal, 24)
           
           TextField("Username", text: $vm.userName)
               .textInputAutocapitalization(.none)
               .modifier(IGTextFieldModifier())
               .padding(.top)
           
           NavigationLink(
               destination: CreatePasswordView()) {
                   Text("Next")
                       .font(.subheadline)
                       .fontWeight(.semibold)
                       .foregroundStyle(Color.white)
                       .frame(width: 342, height: 44)
                       .background(Color(.systemBlue))
                       .clipShape(RoundedRectangle(cornerRadius: 8))
               }
               .padding(.vertical)

           Spacer()
       }

   }
}

#Preview {
   CreateUserNameView()
       .environmentObject(RegistrationViewModel())
}
