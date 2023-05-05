//
//  LayoutPriorityPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 05/05/2023.
//

import SwiftUI

// Layout Priority: Property by which parent layout allocate space to child views.

struct LayoutPriorityPlayground: View {
    var body: some View {
        HStack {
            Text("Life is too short to wait! Start now.")
                .background(Color.pink.opacity(0.1))
                .layoutPriority(1)
            
            Text("Only in the darkness you can see stars.")
                .background(Color.green.opacity(0.1))
        }
    }
}

struct LayoutPriorityPlayground_Previews: PreviewProvider {
    static var previews: some View {
        LayoutPriorityPlayground()
    }
}
