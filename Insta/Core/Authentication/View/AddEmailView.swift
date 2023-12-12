//
//  AddEmailView.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import SwiftUI

struct AddEmailView: View {
    
    @EnvironmentObject var vm : RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Add your Email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Email", text: $vm.email)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            
            NavigationLink(
                destination: CreateUserNameView()) {
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
    AddEmailView()
        .environmentObject(RegistrationViewModel())
}
