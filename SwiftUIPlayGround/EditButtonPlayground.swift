//
//  EditButtonPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 10/05/2023.
//

import SwiftUI

// EditButton: Edit Button toggles environment's edit mode value for content within a container that supports edit mode.

// delete, move

struct EditButtonPlayground: View {
    @State private var listOfFruits = ["Apple", "Banana", "Orange", "Grapes", "Watermelon"]
    
    var body: some View {
        NavigationStack {
            List {
    //            Text("Apple")
    //            Text("Banana")
                
                ForEach(listOfFruits, id: \.self) { fruit in
                    Text(fruit)
                }
                .onDelete { indexSet in
                    listOfFruits.remove(atOffsets: indexSet)
                }
                .onMove { fromOffsets, toOffset in
                    listOfFruits.move(fromOffsets: fromOffsets, toOffset: toOffset)
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

struct EditButtonPlayground_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonPlayground()
    }
}
