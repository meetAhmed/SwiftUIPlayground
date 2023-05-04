//
//  LazyStackPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 04/05/2023.
//

import SwiftUI

// LazyStack: Does not create items untill it needs to render them on screen.
//  LazyVStack
//  LazyHStack

struct LazyStackPlayground: View {
    var body: some View {
//        ScrollView {
//            LazyVStack {
//                ForEach(0..<1000, id: \.self) { num in
//                    Text("Element \(num)") // Element 900
//                        .onAppear {
//                            print("Element \(num)")
//                        }
//                }
//            }
//        }
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<1000, id: \.self) { num in
                    Text("Element \(num)") // Element 900
                        .onAppear {
                            print("Element \(num)")
                        }
                }
            }
        }
    }
}

struct LazyStackPlayground_Previews: PreviewProvider {
    static var previews: some View {
        LazyStackPlayground()
    }
}
