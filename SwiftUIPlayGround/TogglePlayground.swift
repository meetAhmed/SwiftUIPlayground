//
//  TogglePlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 02/05/2023.
//

import SwiftUI

// Toggle: Switch between binary state, 0 or 1.

struct TogglePlayground: View {
    @State private var vibrateOnText = false
    @State private var notification = true
    
    var body: some View {
        VStack {
            Toggle("Vibrate on Text", isOn: $vibrateOnText)
                .tint(.yellow)
            
            Toggle(isOn: $notification) {
                Text("Notification")
                    .font(.headline)
            }
            .toggleStyle(.button)
        }
        .padding()
    }
}

struct TogglePlayground_Previews: PreviewProvider {
    static var previews: some View {
        TogglePlayground()
    }
}
