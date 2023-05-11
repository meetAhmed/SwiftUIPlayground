//
//  LabelPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 10/05/2023.
//

import SwiftUI

// iOS 14 or above.
// Label: Most common user interface component is combination of icon and text. For this reason, SwiftUI has standard view for showing text and icon side by side, called Label. Label is particularly helpful for menus, lists etc.

struct LabelPlayground: View {
    var body: some View {
        List {
            Label("LightBulb", systemImage: "lightbulb.fill")
                .foregroundColor(.green)
            
            Label("Lamp", systemImage: "lamp.floor.fill")
                .labelStyle(.iconOnly)
            
            // our own view
            HStack {
                Image(systemName: "sofa.fill")
                Text("Sofa")
            }
            
            Label {
                Text("Fan")
                    .font(.headline)
            } icon: {
                Image(systemName: "fan.floor.fill")
                    .foregroundColor(.black)
            }
            
            Label {
                Text("Custom icon")
            } icon: {
                Circle()
                    .fill(.orange)
            }
            
        }
    }
}

struct LabelPlayground_Previews: PreviewProvider {
    static var previews: some View {
        LabelPlayground()
    }
}
