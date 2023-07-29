//
//  CombinePublisherPlayground.swift
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
 
 1) Just<Output> - Provides single value and completes.
 
 2) Future<Output, Failure> - Closure that resolves to single output value or failure completion.
 
 3) Deferred - Wraps creation of any publisher and only creates it when a subscriber is present.
 
 4) AnyPublisher<Output, Failure> - Publisher is a protocol. AnyPublisher, on the other hand, is a concrete implementation of the Publisher protocol. It does not have any notable properties of its own but instead forwards the elements and completion values from its upstream publisher. AnyPublisher is used to wrap a publisher whose specific type details we wish to keep hidden or not expose. To expose an instance of AnyPublisher to a downstream subscriber, we can utilize the eraseToAnyPublisher() method.
 
 5) Empty - Only used for task completion. Publisher that never publishes any values and optionally finishes immediately. We can create Never publisher, one which never sends values and never finishes or fails with Empty(completeImmediately: false)
 
 6) Sequence - Publish sequence of elements.
 
 7) Fail - Teminates publishing with specified error.
 
 8) Record - Publishers that allows for recording series of input and completion, for later playback to each subscriber.
 
 9) @Published - Property wrapper that adds a combine publisher to any property.
 
 */

class CombinePublisherLearning: ObservableObject {
    // just
    let justPublisher = Just("Hello World!")
    let justPublisher2 = Just(10)
    
    var cancellables: Set<AnyCancellable> = []
    
    // future
    let futurePublisher = Future<Int, Never> { promise in
        print("futurePublisher started processing")
        // return random int after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            promise(.success(Int.random(in: 10...50)))
        }
    }
    
    // deferred
    let deferredPublisher = Deferred {
        Future<Int, Never> { promise in
            print("deferredPublisher futurePublisher started processing")
            // return random int after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                promise(.success(Int.random(in: 10...50)))
            }
        }
    }
    
    // anypub
    let anyPublisher = Just("Just - AnyPublisher")
        .eraseToAnyPublisher()
    
    let emptyPub = Empty<Any, Never>()
    
    let seqPublisher = [1, 2, 3, 4].publisher
    
    let failPub = Fail<Any, CustomError>(error: CustomError(message: "This is demo of fail publisher"))
    
    let failAndAnyPub = Bool.random() ? Just("Bool is ture").setFailureType(to: Error.self).eraseToAnyPublisher() : Fail(error: CustomError(message: "Bool is false")).eraseToAnyPublisher()
    
    // record
    let recordPublisher = Record<String, Never> { record in
        record.receive("Op 1")
        record.receive("Op 2")
        record.receive("Op 3")
        record.receive(completion: .finished)
    }
    
    @Published var username = ""
    
    init() {
        // just
        justPublisher
            .sink { _ in
                print("justPublisher completed")
            } receiveValue: { value in
                print("justPublisher value \(value)")
            }
            .store(in: &cancellables)
        
        $username
            .sink { value in
                print("username \(value)")
            }
            .store(in: &cancellables)
    }
}

struct CombinePublisherPlayground: View {
    @StateObject var combineLearning = CombinePublisherLearning()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CombinePublisherPlayground_Previews: PreviewProvider {
    static var previews: some View {
        CombinePublisherPlayground()
    }
}

struct CustomError {
    let message: String
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        message
    }
}
