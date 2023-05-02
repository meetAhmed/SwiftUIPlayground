//
//  ImagePlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 02/05/2023.
//

import SwiftUI

// SF Symbol (System Icons)
// Asset Image

struct ImagePlayground: View {
    var body: some View {
        VStack {
//            Image(systemName: "person")
//                .font(.largeTitle)
//                .foregroundColor(.green)
//
//            Image(systemName: "keyboard")
//                .font(.largeTitle)
//
            Image("Nature2")
                .resizable()
//                .scaledToFit()
                .aspectRatio(contentMode: .fit)
//                .frame(width: 200, height: 200)
                .clipShape(Capsule())
        }
    }
}

struct ImagePlayground_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlayground()
    }
}
