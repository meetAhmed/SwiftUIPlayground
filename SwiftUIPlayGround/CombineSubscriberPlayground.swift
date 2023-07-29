//
//  CombineSubscriberPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 28/07/2023.
//

import Combine
import SwiftUI

/* Combine core concepts:
 
 - Publisher
 - Subscriber
 - Operators
 - Subjects
 
 Publisher provides data when available and upon request. Publisher without subscriber does not provide any data.
 
 Subscriber is responsible for requesting data and accepting data provided by Publisher. Subscriber initiates request for data.
 
 Two built in subscribers:
 
 1) Sink: Attaches subscriber with closure based behavior to publisher.
 
 2) Assign: Assign each element from publisher to property on an object.
 
 - assign(to: on:) - Set a given property each time a publisher produces a value.
 
 - assign(to: ) - Republishes elements received from a publisher, by assigning them to a property marked as a publisher. The operator manages the life cycle of the subscription, canceling the subscription automatically when the Published instance deinitializes.
 
 */

class NumbersThings {
    var numInStr = ""
}

class CombineSubscriberLearning {
    let publisher = [1, 2, 3].publisher
    let publisher2 = ["One", "Two", "Three"].publisher
    var cancellable: AnyCancellable? = nil
    var cancellables: Set<AnyCancellable> = []
    
    var numInStr = "" {
        didSet {
            print("numInStr: \(numInStr)")
        }
    }
    
    // publisher
    @Published var time: Date = Date()
    
    var numObject = NumbersThings()
    
    init() {
        
        // sink
        cancellable = publisher
        //            .sink { num in
        //
        //            }
            .sink { _ in
                print("Sink completed")
            } receiveValue: { num in
                print("Sink receive value \(num)")
            }
        
        //        cancellable?.cancel()
        
        publisher2
        //            .assign(to: \.numInStr, on: self)
            .assign(to: \.numInStr, on: numObject)
            .store(in: &cancellables)
        
        var num = 10
        multiply(num: &num)
        print("Num is now \(num)")
        
        Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .assign(to: &$time)
        
    }
    
    func multiply(num: inout Int) {
        num *= 10
    }
}

struct CombineSubscriberPlayground: View {
    var body: some View {
        Text("Hello World!")
    }
}

struct CombineSubscriberPlayground_Previews: PreviewProvider {
    static var previews: some View {
        CombineSubscriberPlayground()
    }
}
