//
//  ContentView.swift
//  Instagram
//
//  Created by Omkar Anarse on 23/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if vm.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let currentUser = vm.currentUser{
                MainTabView(user: currentUser)
            }
        }
    }
}

#Preview {
    ContentView()
}
