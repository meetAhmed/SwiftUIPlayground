//
//  DividerPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 05/05/2023.
//

import SwiftUI

// Divider: Visual element that is used to separate other content.

struct DividerPlayground: View {
    var body: some View {
        VStack {
            Text("Welcome Username!")
            
            // Horizontal
            Divider()
                .frame(width: 200)
                .frame(height: 5)
                .overlay(.blue)
            
            Text("Something about user. A Description.")
            
            HStack {
                Image(systemName: "person.circle.fill")
                
                // vertical line
                Divider()
                    .frame(height: 50)
                    .frame(width: 5)
                    .overlay(.yellow)
                
                Text("Welcome Username")
            }
            .padding(.top, 100)
            
        }
    }
}

struct DividerPlayground_Previews: PreviewProvider {
    static var previews: some View {
        DividerPlayground()
    }
}
