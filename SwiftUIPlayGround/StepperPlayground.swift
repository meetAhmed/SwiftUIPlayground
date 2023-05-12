//
//  StepperPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 12/05/2023.
//

import SwiftUI

// Stepper: A control that performs increment and decrement actions. Lets user select value from range.

/*
 Stepper can be used to:
 
 1) Change a value up or down by 1.
 2) Operate strictly over a prescribed range.
 3) Step by specific amounts over a stepper’s range of possible values.
 */

struct StepperPlayground: View {
    @State private var age = 0
    private let range = 1...10
    
    var body: some View {
        VStack {
            
            // default
            Stepper("Enter your age", value: $age)
            Text("You entered: \(age)")
            
            // custom impl
            Stepper("Custom Increase/decrease") {
                age += 10
            } onDecrement: {
                age -= 5
            }
            
            Divider()
            
            Stepper(value: $age, in: range, step: 2) {
                Text("Stepper with range")
                    .font(.largeTitle)
            }

            
        }
        .padding()
    }
}

struct StepperPlayground_Previews: PreviewProvider {
    static var previews: some View {
        StepperPlayground()
    }
}
