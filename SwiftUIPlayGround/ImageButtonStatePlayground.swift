//
//  ImageButtonStatePlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 26/04/2023.
//

import SwiftUI

struct ImageButtonStatePlayground: View {
    
    // Image
    // 1) SF Symbol
    // 2) Assets
    
    @State var counter = 1
    
    var body: some View {
//        Image(systemName: "person.circle")
//            .font(.largeTitle)
//        Image("Nature")
//            .resizable()
//            .scaledToFill()
//            .ignoresSafeArea()
//        Button("Click Me") {
//            // execute code for button press
//            print("Button is tapped")
//        }
        Button {
            counter += 10
        } label: {
            Text("Login \(counter)")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

struct ImageButtonStatePlayground_Previews: PreviewProvider {
    static var previews: some View {
        ImageButtonStatePlayground()
    }
}
