//
//  OverlayPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 09/05/2023.
//

import SwiftUI

// overlay: this modifier is used to place one or more views in front of another view.

struct OverlayPlayground: View {
    var body: some View {
        VStack {
            Text("Title of page")
            Text("Description of page")
            
            Spacer()
            
            Image("Nature")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .overlay(alignment: .bottom) {
                    Text("Some Forest Name")
                        .foregroundColor(.white)
                        .padding()
                        .background(.black)
                }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(alignment: .topLeading) {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .padding()
                .background(
                    Circle()
                        .fill(.black.opacity(0.8))
                )
                .padding()
        }
    }
}

struct OverlayPlayground_Previews: PreviewProvider {
    static var previews: some View {
        OverlayPlayground()
    }
}
