//
//  PickerPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 02/05/2023.
//

import SwiftUI

// Allows us to select value from list of options.

struct PickerPlayground: View {
    @State private var selectedFruit = ""
    var listOfFruits: [String] = ["Apple", "Orange", "Grape"]
    
    var body: some View {
        VStack {
            Picker("Select Fruit", selection: $selectedFruit) {
                ForEach(listOfFruits, id: \.self) { fruit in
                    Text(fruit)
                        .font(.subheadline)
                }
            }
            .pickerStyle(.automatic)
            
            Text("Selected: \(selectedFruit)")
        }
        .padding()
    }
}

struct PickerPlayground_Previews: PreviewProvider {
    static var previews: some View {
        PickerPlayground()
    }
}
