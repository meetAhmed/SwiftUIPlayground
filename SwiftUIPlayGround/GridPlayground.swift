//
//  GridPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 05/05/2023.
//

import SwiftUI

/*
 
 Grid: Grid view arranges child views in rows and columns.
    LazyVGrid: Grid that grows vertically.
    LazyHGrid: Grid that grows horizontally.
 
 GridItem: Fixed, Flexible, Adaptive
    Fixed: Single item with fixed size.
    Flexible: Single flexible item in available space.
    Adaptive: Multiple items in available space.
 
 */

struct GridPlayground: View {
//    let columns: [GridItem] = Array(repeating: GridItem(.fixed(120)), count: 4)
//    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
//    let columns: [GridItem] = [GridItem(.adaptive(minimum: 120))]
    
    let rows: [GridItem] = [GridItem(.fixed(120)), GridItem(.fixed(120))]
    
    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columns) {
//                ForEach(0..<20) { num in
//                    Text("Element \(num)")
//                        .padding()
//                        .background(Color.green.opacity(0.3))
//                }
//            }
//        }
//        ScrollView {
//            LazyVGrid(columns: columns) {
//                ForEach(0..<20) { num in
//                    Text("Element \(num)")
//                        .padding()
//                        .background(Color.blue.opacity(0.3))
//                }
//            }
//        }
//        ScrollView {
//            LazyVGrid(columns: columns) {
//                ForEach(0..<20) { num in
//                    Text("Element \(num)")
//                        .padding()
//                        .background(Color.yellow.opacity(0.2))
//                }
//            }
//        }
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0..<200) { num in
                    Text("Element \(num)")
                        .padding()
                        .background(Color.purple.opacity(0.1))
                }
            }
        }
    }
}

struct GridPlayground_Previews: PreviewProvider {
    static var previews: some View {
        GridPlayground()
    }
}
