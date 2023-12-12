//
//  UsersStatView.swift
//  Instagram
//
//  Created by Omkar Anarse on 23/11/23.
//

import SwiftUI

struct UsersStatView: View {
    
    let value : String
    let title : String
    
    var body: some View {
        HStack {
            VStack{
                Text("\(value)")
                    .font(
                      Font.custom("SF Pro Text", size: 16)
                        .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.primary)

                Text("\(title)")
                    .font(Font.custom("SF Pro Text", size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.primary)
            }
            .frame(width: 76)
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 4)
        .frame(width: 80, alignment: .center)

    }
}

#Preview {
    UsersStatView(value: "12", title: "Posts")
}
