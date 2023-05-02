//
//  ButtonPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 01/05/2023.
//

import SwiftUI

// Button - SwiftUI control that triggers an action when user taps on it.

struct ButtonPlayground: View {
    var body: some View {
//        Button("Login") {
//            print("Login Tapped")
//        }
//        Button("Login", action: handleLoginAction)
//        Button {
//
//        } label: {
//            Text("Login")
//                .foregroundColor(.green)
//                .font(.title)
//        }
        Button(action: handleLoginAction) {
            Text("Login")
        }
        .buttonStyle(.borderedProminent)
    }
    
    func handleLoginAction() {
        
    }
}

struct ButtonPlayground_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlayground()
    }
}
