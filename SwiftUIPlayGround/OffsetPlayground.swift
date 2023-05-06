//
//  OffsetPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 06/05/2023.
//

import SwiftUI

// offset or shift view by specified horizontal and vertical amount.

struct OffsetPlayground: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(.red)
                .frame(width: 100, height: 100)
                .zIndex(1)
            
            Rectangle()
                .fill(.yellow)
                .frame(width: 100, height: 100)
                .offset(x: -50, y: 50)
        }
    }
}

struct OffsetPlayground_Previews: PreviewProvider {
    static var previews: some View {
        OffsetPlayground()
    }
}
