//
//  ZIndexPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 05/05/2023.
//

import SwiftUI

// ZIndex: Controls display order of overlapping views. Default value is 0.

// Built in shapes in swiftUI:
// Rectangle
// RoundedRectangle
// Capsule
// Ellipse
// Circle

struct ZIndexPlayground: View {
    var body: some View {
        VStack {
            
            Rectangle()
                .fill(.green)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill()
            
        }
    }
}

struct ZIndexPlayground_Previews: PreviewProvider {
    static var previews: some View {
        ZIndexPlayground()
    }
}
