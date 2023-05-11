//
//  TextSelectionPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 10/05/2023.
//

import SwiftUI

// textSelection(): (available in iOS 15 or above): controls whether people can select text within this view. Sometimes we need to copy useful information from Text views, we can apply this to individual or container to make each text selectable.

struct TextSelectionPlayground: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Event Details")
            
            Text("25 May 2023 at 10:00 AM")
                .textSelection(.enabled)
            
            Text("Address: Street A, City X, Country")
                .textSelection(.enabled)
        }
    }
}

struct TextSelectionPlayground_Previews: PreviewProvider {
    static var previews: some View {
        TextSelectionPlayground()
    }
}
