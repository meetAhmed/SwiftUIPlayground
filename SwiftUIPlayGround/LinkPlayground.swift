//
//  LinkPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 12/05/2023.
//

import SwiftUI

// Link: Control for navigating to a URL.

struct LinkPlayground: View {
    let url = URL(string: "https://www.google.com")
    
    var body: some View {
        VStack {
            if let url {
                Link("Visit our website", destination: url)
                
                Link(destination: url) {
                    Text("Terms And Conditions")
                        .font(.largeTitle)
                }
                
            }
        }
    }
}

struct LinkPlayground_Previews: PreviewProvider {
    static var previews: some View {
        LinkPlayground()
    }
}
