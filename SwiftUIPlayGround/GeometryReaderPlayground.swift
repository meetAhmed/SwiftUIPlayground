//
//  GeometryReaderPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 06/05/2023.
//

import SwiftUI

// Geometry Reader: Geometry Reader is view in swiftUI that allows us to get size of view.

struct GeometryReaderPlayground: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.green.opacity(0.5))
                    .frame(width: geometry.size.width * 0.75, height: 100)
                
                Rectangle()
                    .fill(.blue.opacity(0.5))
                    .frame(width: geometry.size.width * 0.25, height: 100)
            }
        }
    }
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

struct GeometryReaderPlayground_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderPlayground()
    }
}
