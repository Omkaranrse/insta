//
//  CompleteSignUpView.swift
//  Instagram
//
//  Created by Omkar Anarse on 01/12/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    
    @EnvironmentObject var viewModel : RegistrationViewModel

    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("Welcome to Instagram , \(viewModel.userName) 🥳")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            Text("Click below to complete registration and start using Instagram 😉")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button(action: {
                Task{
                    try await viewModel.createUser()
                }
            }, label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(width: 342, height: 44)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 8))

            })
            .padding(.vertical)

            Spacer()
        }

    }
}

#Preview {
    CompleteSignUpView()
        .environmentObject(RegistrationViewModel())
}
