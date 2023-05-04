//
//  ScrollViewPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 03/05/2023.
//

import SwiftUI

// ScrollView: Contains child views and displays them in scrollable manner.

// ScrollViewReader: Move Scrollview to a particular position using scrollTo().

struct ScrollViewPlayground: View {
    @State private var isNotificationOn = false
    
    var body: some View {
        // vertical orientation
//        ScrollView(showsIndicators: false) {
//            // static elements
//            Text("Element 1")
//            Text("Element 2")
//            Text("Element 3")
//
//            Text("Element with max width than others")
//
//            Toggle("Notifications", isOn: $isNotificationOn)
//
//            // dynamic elements
//            ForEach(0..<50) { number in
//                Text("Dynamic Test element \(number)")
//            }
//        }
//        .padding()
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                Text("Element 1")
//                Text("Element 2")
//                Text("Element 3")
//
//                ForEach(0..<20) { num in
//                    Text("Dynamic element \(num)")
//                }
//            }
//        }
        ScrollViewReader { reader in
            ScrollView(showsIndicators: false) {
                Button("Move to position #15") {
                    reader.scrollTo(15, anchor: .top)
                }
                .buttonStyle(.borderedProminent)
                
                ForEach(0..<20) { num in
                    Text("\(num)")
                        .padding()
                        .background(Color.green.opacity(0.5))
                        .clipShape(Circle())
                        .id(num)
                }
            }
        }
    }
}

struct ScrollViewPlayground_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewPlayground()
    }
}
