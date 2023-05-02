//
//  SliderPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 02/05/2023.
//

import SwiftUI

// Slider: Select value from bounded range.
//         Default: 0.0 and 1.0

struct SliderPlayground: View {
    @State private var value: Double = 0.5
    @State private var slider2Value: Double = 0.5
    
    var body: some View {
        VStack {
            Text("Value: \(value)")
                .font(.headline)
            
            Text("slider2Value: \(slider2Value)")
                .font(.headline)
            
            HStack {
                
            }
            .frame(width: 100, height: 100)
            .background(Color.green)
            .opacity(value)
            
            Slider(value: $value)
            
            Slider(value: $slider2Value, in: 0...100, step: 10) {
                // label
                Text("Select a range")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            }
            .tint(.yellow)
            .foregroundColor(.green)
                
        }
        .padding()
    }
}

struct SliderPlayground_Previews: PreviewProvider {
    static var previews: some View {
        SliderPlayground()
    }
}
