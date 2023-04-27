//
//  UserInputPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 27/04/2023.
//

import SwiftUI

// 1) TextField -> Single line
// 2) TextEditor -> Mulitple lines

struct UserInputPlayground: View {
    @State private var username = ""
    @State private var email = ""
    @State private var userInputName = ""
    @State private var description = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            TextField("Enter your name", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Enter your email", text: $email)
                .padding()
                .foregroundColor(.green)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(20)
            
            Text("User entered: \(userInputName)")
            
            Button("Click Me") {
                userInputName = username
            }
            
            TextEditor(text: $description)
                .frame(height: 200)
                .foregroundColor(.red)
                .background(Color.yellow.opacity(0.1))
            
            Spacer()
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
    }
}

struct UserInputPlayground_Previews: PreviewProvider {
    static var previews: some View {
        UserInputPlayground()
    }
}
