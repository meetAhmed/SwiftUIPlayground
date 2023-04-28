//
//  ListPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 28/04/2023.
//

import SwiftUI

struct ListPlayground: View {
    
    var listOfAnimals: [Animal] = [
        .init(name: "Tiger", color: .yellow),
        .init(name: "Dog", color: .brown),
        .init(name: "Horse", color: .red)
    ]
    
    var body: some View {
        VStack {
            List {
                // static
                Section("Static Elements") {
                    Text("Item 1")
                    Text("Item 2")
                    Text("Item 3")
                }
                
//                // dynamic
//                ForEach(0..<5, id: \.self) { num in
//                    Text("Item \(num)")
//                }
                
                // list of animlas
                Section("Dynamic Elements") {
                    ForEach(listOfAnimals) { animal in
                        Text(animal.name)
                            .foregroundColor(animal.color)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}

struct ListPlayground_Previews: PreviewProvider {
    static var previews: some View {
        ListPlayground()
    }
}

// Model
struct Animal: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let color: Color
}
