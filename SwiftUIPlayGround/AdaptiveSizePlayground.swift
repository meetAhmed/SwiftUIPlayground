//
//  AdaptiveSizePlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 13/05/2023.
//

import SwiftUI

/*
 
 Two ways to make your iPhone app responsive. (Portrait/Landscape)
 
 1) UserInterfaceSizeClass (iOS 13 and above)
 2) ViewThatFits (iOS 16 and above)
 
 --> UserInterfaceSizeClass:
        Collection/Set of values that indicates the visual size available to the view.
     This value tells us about the amount of space available to our views in given direction.
     We can read size class value from Environment. There are two types of size classes.
 
     1) VerticalSizeClass
     2) HorizontalSizeClass
 
     Each size class has two traits:
    
     1) Compact: narrow space.
     2) Regular: wider space.
 
     SwiftUI sets the size class based on:
 
     -> Current device type.
     -> Orientation of device.
 
     Common thing among most/all iPhones: verticalSizeClass == .compact (this means device is in landscape mode)
 
 --> ViewThatFits:
        It is a view that adapts to available space by providing first child view that fits.
     It evaluates its child views in the order we provide to init. It selects first child
     whose ideal size on provided axes fits within proposed size. We need to provide views
     in order of preference. Usually this order is largest to smallest.
     Be default, it has both horizontal and vertical axes.
 
 ----------------------------------------------------------------------------------------
 ----------------------------------------------------------------------------------------
  
  Question: The main reason for blueness of the sky is?

  a) Due to the absorption of blue light due to the air.
  b) Due to the presence of water vapor.
  c) Due to the scattering of sunlight by air molecules.
  d) None of the above.
 
 https://developer.apple.com/design/human-interface-guidelines/layout
 
 */

// Model
struct Quiz {
    let question: String
    let answerA: String
    let answerB: String
    let answerC: String
    let answerD: String
}

struct AdaptiveSizePlayground: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    private let quiz = Quiz(
        question: "The main reason for blueness of the sky is?",
        answerA: "a) Due to the absorption of blue light due to the air.",
        answerB: "b) Due to the presence of water vapor.",
        answerC: "c) Due to the scattering of sunlight by air molecules.",
        answerD: "d) None of the above."
    )
    
    // iPhone
    var isDeviceInLandscapeMode: Bool {
        verticalSizeClass == .compact
    }
    
    var body: some View {
        VStack {
//            if isDeviceInLandscapeMode {
//                RegularView(quiz: quiz)
//            } else {
//                CompactView(quiz: quiz)
//            }
            // Multiple child views, it only select/provide one view to device that fits the space
            ViewThatFits {
                RegularView(quiz: quiz)
                CompactView(quiz: quiz)
            }
        }
        .padding()
    }
}

// Landscape
struct RegularView: View {
    let quiz: Quiz
    
    var body: some View {
        VStack {
            Text(quiz.question)
                .font(.headline)
            
            HStack {
                VStack {
                    AnswerRow(answer: quiz.answerA)
                    AnswerRow(answer: quiz.answerB)
                }
                VStack {
                    AnswerRow(answer: quiz.answerC)
                    AnswerRow(answer: quiz.answerD)
                }
            }
        }
    }
}

// Portrait
struct CompactView: View {
    let quiz: Quiz
    
    var body: some View {
        VStack {
            Text(quiz.question)
                .font(.headline)
            
            AnswerRow(answer: quiz.answerA)
            AnswerRow(answer: quiz.answerB)
            AnswerRow(answer: quiz.answerC)
            AnswerRow(answer: quiz.answerD)
        }
    }
}

struct AnswerRow: View {
    let answer: String
    
    var body: some View {
        Text(answer)
            .font(.caption)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 0.5)
            )
    }
}

struct AdaptiveSizePlayground_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveSizePlayground()
    }
}
