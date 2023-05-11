//
//  SecureField.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 10/05/2023.
//

import SwiftUI

// SecureField: Same as TextField. Used when we do not want user's text to be visible. Typically used for entering password and other sensitive information.

// TextField modifiers:

// .keyboardType(): Keyboard type for textfield.

// .textContentType(): Sets text content type for the view, which system users to offer suggestions when user enter text.

// .textInputAutoCapitalization(): (available in iOS 15 or above) When we need to automatically capitalize words, sentence etc.

struct SecureFieldPlayground: View {
    @State private var emailText = ""
    @State private var passwordText = ""
    
    var body: some View {
        VStack(spacing: 40) {
            
            TextField("Email", text: $emailText)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .textInputAutocapitalization(.words)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.1))
                )
            
            SecureField("Password", text: $passwordText)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.1))
                )
            
        }
        .padding()
    }
}

struct SecureFieldPlayground_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldPlayground()
    }
}
