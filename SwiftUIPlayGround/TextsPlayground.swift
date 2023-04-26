//
//  TextsPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 25/04/2023.
//

import SwiftUI

struct TextsPlayground: View {
    var body: some View {
        Text("Only in the darkness, you can see stars. Only in the darkness, you can see stars. Only in the darkness, you can see stars. Only in the darkness, you can see stars.")
//            .fontWeight(.bold)
            //.font(.largeTitle)
            .font(.system(size: 22, weight: .semibold))
            .foregroundColor(.green)
//            .underline()
//            .italic()
//            .strikethrough()
            .padding()
            .multilineTextAlignment(.center)
//            .lineLimit(2)
//            .truncationMode(.head)
//            .lineSpacing(15)
//            .kerning(10)
//            .rotationEffect(Angle(degrees: 45))
            .rotation3DEffect(Angle(degrees: 45), axis: (x: 1, y: 0, z: 0))
            .shadow(color: .red, radius: 2, x: 0, y: 2)
    }
}

struct TextsPlayground_Previews: PreviewProvider {
    static var previews: some View {
        TextsPlayground()
    }
}
