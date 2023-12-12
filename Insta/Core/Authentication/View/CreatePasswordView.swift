//
//  CreatePasswordView.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import SwiftUI

struct CreatePasswordView: View {
    
    @EnvironmentObject var viewModel : RegistrationViewModel

    var body: some View {
        VStack(spacing: 12) {
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Your password must be at least 6 charachters in length")
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            SecureField("Password", text: $viewModel.password)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            
            NavigationLink(
                destination: CompleteSignUpView()) {
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
    CreatePasswordView()
        .environmentObject(RegistrationViewModel())
}
