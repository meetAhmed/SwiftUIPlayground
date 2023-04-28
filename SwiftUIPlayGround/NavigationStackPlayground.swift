//
//  NavigationStackPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 28/04/2023.
//

import SwiftUI

// NavigationStack -> Data Driven instead of View driven.
//                 -> Introduce in iOS 16.

// Model
struct Flower: Hashable {
    let name: String
    let color: Color
}

struct Fruit: Hashable {
    let name: String
}

struct NavigationStackPlayground: View {
    @State private var isUserLoggedIn = false
    
    var listOfFlowers: [Flower] = [
        .init(name: "Tulip", color: .red),
        .init(name: "Rose", color: .red),
        .init(name: "Sun Flower", color: .yellow)
    ]
    
    var listOfFruits: [Fruit] = [
        .init(name: "Apple"),
        .init(name: "Water Melon")
    ]
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            // content
            VStack {
//                NavigationLink("Goto screen 2") {
//                    // destination
//                    Text("Screen 2")
//                }
//
//                Button("Login") {
//                    isUserLoggedIn.toggle()
//                }
                List {
//                    Section("Flowers") {
//                        ForEach(listOfFlowers, id: \.name) { flower in
//                            // content for each flower
//                            // first part of nav link
//                            NavigationLink(value: flower) {
//                                Text(flower.name)
//                                    .foregroundColor(flower.color)
//                            }
//                        }
//                    }
                    
                    Section("Fruits") {
                        ForEach(listOfFruits, id: \.name) { fruit in
                            NavigationLink(value: fruit) {
                                Text(fruit.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Screen 1")
            .navigationDestination(isPresented: $isUserLoggedIn) {
                Text("HomeView")
            }
            .navigationDestination(for: Flower.self) { flower in
                Text(flower.name)
            }
            .navigationDestination(for: Fruit.self) { fruit in
                VStack {
                    Text(fruit.name)
                    Button("Next Fruit") {
                        path.append(Fruit(name: "Banana"))
                        path.append(Flower(name: "SomeFlower", color: .red))
                    }
//                    Button("Goto home") {
//                        path.removeAll()
//                    }
                }
            }
        }
    }
}

struct NavigationStackPlayground_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackPlayground()
    }
}
