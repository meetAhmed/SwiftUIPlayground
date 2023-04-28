//
//  SwiftNavigationViewPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 27/04/2023.
//

import SwiftUI

// NavigationView -> Navigate between screens/views

struct NavigationViewPlayground: View {
    @State private var isUserLoggedIn = false
    
    var body: some View {
        NavigationView {
            // content
            VStack {
                Text("Hello There!")
                
//                NavigationLink("Go to screen 2", destination: Text("Screen 2"))
                
                NavigationLink("Go to screen 2", destination: SecondView())
                
                NavigationLink("", destination: SecondView(), isActive: $isUserLoggedIn)
                
                Button("Login") {
                    isUserLoggedIn.toggle()
                }
            }
            .navigationTitle("Screen 1")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Text("Settings")
                        Image(systemName: "house")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Profile")
                }
            }
        }
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Text("Welcome to screen 2")
        }
        .navigationTitle("Screen 2")
    }
}

struct SwiftNavigationViewPlayground_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewPlayground()
    }
}
