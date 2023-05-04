//
//  FormPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 04/05/2023.
//

import SwiftUI

// Form: Container view that is designed for grouping controls used for data entry.

struct FormPlayground: View {
    @State private var notification = ""
    @State private var notificationSound = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Notifications") {
                    Picker("Notify Me", selection: $notification) {
                        Text("Mentions").tag("Mentions")
                        Text("Messages").tag("Messages")
                        Text("Everything").tag("Everything")
                    }
                    .pickerStyle(.navigationLink)
                    Toggle("Play Notification Sound", isOn: $notificationSound)
                }
                
                Section("Others") {
                    Button("Reset") {}
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct FormPlayground_Previews: PreviewProvider {
    static var previews: some View {
        FormPlayground()
    }
}
