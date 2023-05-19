//
//  AnimationPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 19/05/2023.
//

import SwiftUI

/*
 
 animation(_: value) (Implicit)
    animation is a view modifier. First param is animation behavior and second param is changing value, to which animation reacts.
 
 Animation with different behaviors:
 
 1) Linear: animation is performed at constant speed.
 2) easeOut: starts out fast and slows at the end.
 3) easeIn: starts out slow and speeds up at the end.
 4) easeInOut: starts slow, speeds up and slows down.
 5) spring: animation that move to targe point, overshoot a little and then bounce back.
 
 .repeatCount & .repeatForever
    How many times animation should repeat.
 
 autoreverses: autoreverses will make animation bounce back and forth from previous view to current view. It is true when animation is repeated.
 
 animation can be used to modify a view's color, opacity, rotation, scale.
 
 withAnimation(): (Explicit)
    Function that accepts a closure containing the changes we want to animate. This function is used to create animations for all affected views.
 
 */

struct AnimationPlayground: View {
    @State private var rotation = 0.0
    @State private var isAnimate = false
    
    var body: some View {
        VStack(spacing: 50) {
            Rectangle()
                .fill(.green)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 1.5), value: rotation)
            
            Button("Rotate rect") {
                rotation += 45.0
            }
            .buttonStyle(.borderedProminent)
            
            HStack {
                Rectangle()
                    .fill(isAnimate ? .red : .black)
                    .frame(width: 100, height: 100)
                
                Rectangle()
                    .fill(isAnimate ? .blue : .black)
                    .frame(width: 100, height: 100)
            }
            
            Button("WithAnimation") {
                withAnimation(.linear(duration: 5)) {
                    isAnimate = true
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct AnimationPlayground_Previews: PreviewProvider {
    static var previews: some View {
        AnimationPlayground()
    }
}
