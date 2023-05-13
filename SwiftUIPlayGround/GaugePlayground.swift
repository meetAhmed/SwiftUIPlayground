//
//  GaugePlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 13/05/2023.
//

import SwiftUI

// Gauge: Gauge shows current level of value in relation to specified finite capacity.
//        Introduced in iOS 16.
//        Automobile guage is a real world example.

struct GaugePlayground: View {
    @State private var progress = 0.6
    
    var body: some View {
        VStack(spacing: 50) {
            
            // Default Range: 0 - 1
            Gauge(value: progress) {
                Text("Download Progress")
            }
            
            Gauge(value: 50.0, in: 20...150) {
                Text("Custom Range")
            } currentValueLabel: {
                Text("50")
                    .foregroundColor(.green)
            } minimumValueLabel: {
                Text("20")
                    .foregroundColor(.yellow)
            } maximumValueLabel: {
                Text("150")
                    .foregroundColor(.red)
            }
            .gaugeStyle(.accessoryLinearCapacity)
            .tint(
                Gradient(colors: [.red, .yellow, .green, .orange])
            )
            
            Button("Download Progress Increase") {
                progress = 0.95
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

struct GaugePlayground_Previews: PreviewProvider {
    static var previews: some View {
        GaugePlayground()
    }
}
