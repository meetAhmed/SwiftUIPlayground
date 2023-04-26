//
//  SwiftUIStacksPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 26/04/2023.
//

import SwiftUI

// VStack -> Vertical
// HStack -> Horizontal
// ZStack -> Stacks elements on top of each other
// Frame
// Spacer()

struct SwiftUIStacksPlayground: View {
    var body: some View {
//        VStack(alignment: .leading, spacing: 10) {
//            Text("Hello World! How are you?")
//            Button("Login") {
//
//            }
//            Image(systemName: "heart")
//        }
//        .padding()
//        .background(Color.green.opacity(0.2))
//        VStack {
//            HStack(alignment: .center, spacing: 30) {
//                Text("Hello")
//                Spacer()
//                VStack {
//                    Text("Username")
//                    Text("Wednesday")
//                }
//            }
//            .padding()
//            .background(Color.blue.opacity(0.2))
//
//            Button("Login Here") {
//
//            }
//        }
//        .padding()
//        ZStack(alignment: .center) {
//            Color.green.opacity(0.2) // First
//            Text("Hello There!") // Second
//            Color.blue.opacity(0.5) // Third
//        }
        VStack {
            Text("Hello")
            
            Button {
                
            } label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(20)
                    .padding()
            }
            
        }
        .padding()
//        .frame(width: 300, height: 300)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(maxWidth: .infinity)
        .background(Color.red.opacity(0.1))
        .cornerRadius(20)
        .padding()
    }
}

struct SwiftUIStacksPlayground_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStacksPlayground()
    }
}
