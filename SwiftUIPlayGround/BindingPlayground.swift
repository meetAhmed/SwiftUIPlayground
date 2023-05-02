//
//  BindingPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 02/05/2023.
//

import SwiftUI

// Difference between state and binding is ownership.

struct BindingPlayground: View {
    @State private var backgroundColor: Color = .red
    
    var body: some View {
        VStack {
            
            HStack {
                
            }
            .frame(width: 200, height: 200)
            .background(backgroundColor)
            
            CustomButtonView(background: $backgroundColor)
        }
    }
}

struct CustomButtonView: View {
    @Binding var background: Color
    
    var body: some View {
        Button("Change color") {
            background = background == .red ? .green : .red
        }
        .buttonStyle(.borderedProminent)
    }
}

struct BindingPlayground_Previews: PreviewProvider {
    static var previews: some View {
        BindingPlayground()
    }
}
