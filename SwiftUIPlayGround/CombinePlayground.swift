//
//  CombinePlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 07/06/2023.
//

/*
 
 Combine: Introduced with iOS 13.0 in 2019. Combine is a framework that empowers us to effectively handle asynchronous events and maintain states within our application.
 
 Combine has three important concepts:
 
 1) Publishers
 2) Subscribers
 3) Operators
 
 Publisher: Publisher protocol declares a type that can deliver a sequence of values over a period of time.
 
 -> Apple also provides numerous helpers in its Foundation framework, which can save us from the need to write custom publishers in many cases.
 
 let sequencePublisher = [1, 2, 3, 4, 5].publisher
 let notificationPublisher = NotificationCenter.default.publisher(for: .NSSystemTimeZoneDidChange)
 let dataTask = URLSession.shared.dataTaskPublisher(for: URL(string: ""))
 
 Publisher types:
 
 -> Just<Output>: Provide single value and completes.
 
 -> Future<Output, Failure>: Initialize with closure that resolves to single output value or failure completion.
 
 -> AnyPublisher<Output, Failure>: Publisher is a protocol. AnyPublisher, on the other hand, is a concrete implementation of the Publisher protocol. It does not have any notable properties of its own but instead forwards the elements and completion values from its upstream publisher. AnyPublisher is used to wrap a publisher whose specific type details we wish to keep hidden or not expose. To expose an instance of AnyPublisher to a downstream subscriber, we can utilize the eraseToAnyPublisher() method.
 
 Deriving a publisher is the first step, but it cannot achieve anything useful until attached by a subscriber.
 
 Subscriber: At the end of the chain of publishers, a subscriber actively processes elements as it receives them. A publisher emits values only when it is specifically requested to do so by a subscriber.
 
 -> Upon subscribing to a publisher, we receive a cancellable object that conforms to the Cancellable protocol. This object allows us to manage the subscription and provides the ability to cancel it if needed.
 -> Subscriber can not subscribe to multiple Publishers.
 -> The input and failure type of a subscriber must match that of the publisher it is subscribing to.
 -> We need to store subscription to avoid it being deallocated.
 -> Subscription is cancelled if it is deallocated.
 
 Subscriber types:
 
 -> sink: Immediately requests a value from the publisher and then waits for incoming values to be emitted.
 -> assign(to: on:): Assign each element received from the publisher to a property on an object.
 
 Operators: Operators are functions defined on instances of publishers. Publishers have a variety of operators available that allow them to manipulate the values received from upstream publishers and republish them in a modified form. These operators provide powerful capabilities for transforming, filtering, combining, and manipulating the stream of values emitted by publishers.
 
 Operator examples:
 
 -> map: uses closure to transform each element it receives from upstream publisher.
 -> filter: only emits values that meet specific requirements.
 
 @Published: Property wrapper that creates a publisher, which can be accessed using the $ operator. The Published attribute is constrained to classes, meaning it can only be used for properties of class types and not structs.
 
 MVVM: Model - View - ViewModel
 
 */

import Combine
import SwiftUI

struct UserModel: Decodable {
    let id: Int
    let name: String
    let username: String
    let website: String
    let address: UserAddress
}

struct UserAddress: Decodable {
    let street: String
}

// Network/Database
class CombineDataService {
    func fetchUsers() -> AnyPublisher<[UserModel], Error> {
        let api = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: api)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [UserModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetch<T: Decodable>() -> AnyPublisher<T, Error> {
        let api = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: api)!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func justPublisherExample() -> Just<Int> {
        Just(100)
    }
    
    func futurePublisherExample() -> Future<String, Never> {
        Future { promise in
            promise(.success("Future Publisher Example"))
        }
    }
    
//    func futurePublisherExample2() -> Future<String, Error> {
//        var userIsLoggedInSuccessfully = false
//        return Future { promise in
//            if userIsLoggedInSuccessfully {
//                promise(.success("User name"))
//            } else {
//                promise(.failure(<#T##Error#>))
//            }
//        }
//    }
    
    func anyPublisherExample() -> AnyPublisher<Int, Never> {
        [1, 2, 3, 4, 50].publisher.eraseToAnyPublisher()
    }
}

class CombineViewModel: ObservableObject {
    let service = CombineDataService()
    var justPublisherCancellable: AnyCancellable? = nil
    var cancellables: Set<AnyCancellable> = []
    
    @Published var userText = ""
    @Published var users: [UserModel] = []
    
    init() {
        test()
        
        service.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished fetching users")
                case .failure(let error):
                    print("Fetching users error \(error)")
                }
            } receiveValue: { users in
                self.users = users
            }
            .store(in: &cancellables)
        
//        let request: AnyPublisher<[UserModel], Error> = service.fetch()
        
////        (service.fetch() as AnyPublisher<[UserModel], Error>)
//            .sink(receiveCompletion: <#T##((Subscribers.Completion<Error>) -> Void)##((Subscribers.Completion<Error>) -> Void)##(Subscribers.Completion<Error>) -> Void#>, receiveValue: <#T##(([UserModel]) -> Void)##(([UserModel]) -> Void)##([UserModel]) -> Void#>)
//
    }
    
    func test() {
        justPublisherCancellable = service.justPublisherExample().sink { _ in
            print("justPublisherExample complete")
        } receiveValue: { number in
            print("justPublisherExample \(number)")
        }
        
        service.futurePublisherExample()
            .map { str in
                "Transformed \(str)"
            }
            .sink { str in
                print("futurePublisherExample \(str)")
                self.userText = str
            }
            .store(in: &cancellables)
        
        service.anyPublisherExample()
            .filter{ $0 > 10 }
            .sink { _ in
                print("anyPublisherExample complete")
            } receiveValue: { num in
                print("anyPublisherExample \(num)")
            }
            .store(in: &cancellables)
        
    }
}

struct CombinePlayground: View {
    // ObservedObject Vs StateObject
    @StateObject var viewModel = CombineViewModel()
    
    var body: some View {
        ForEach(viewModel.users, id: \.id) { user in
            Text(user.username)
        }
    }
}

struct CombinePlayground_Previews: PreviewProvider {
    static var previews: some View {
        CombinePlayground()
    }
}
