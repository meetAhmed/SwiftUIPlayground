//
//  StatePlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 02/05/2023.
//

import SwiftUI

// Allows us to modify struct values.
// SwiftUI recreates view whenever state is changed.

struct StatePlayground: View {
    @State var counter = 0
    @State var isRaining = false
    
    var body: some View {
        VStack {
            Text("Counter = \(counter)")
                .font(.largeTitle)
            
            Button("Increment Counter") {
                counter += 1
            }
            .buttonStyle(.borderedProminent)
            
            // condition ? TrueLogic : FalseLogic num1 > num2
            
            Button(isRaining ? "Stop Rain" : "Start Rain") {
                isRaining.toggle()
            }
        }
    }
}

struct StatePlayground_Previews: PreviewProvider {
    static var previews: some View {
        StatePlayground()
    }
}
