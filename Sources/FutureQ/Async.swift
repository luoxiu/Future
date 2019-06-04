//
//  Async.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/4.
//

import Foundation

public typealias Async = Future<Void, Never>

extension Async {
    
    public static func background<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .global(qos: .background), body: body)
    }
    
    public static func utility<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .global(qos: .utility), body: body)
    }
    
    public static func userInitiated<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .global(qos: .userInitiated), body: body)
    }
    
    public static func userInteractive<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .global(qos: .userInteractive), body: body)
    }
    
    public static func main<T>(after seconds: Double = 0, body: @escaping () throws -> T) -> Future<T, Error> {
        return self.async(after: seconds, queue: .main, body: body)
    }
    
    private static func async<T>(after seconds: Double = 0, queue: DispatchQueue, body: @escaping () throws -> T) -> Future<T, Error> {
        let p = Promise<T, Error>()
        
        queue.asyncAfter(deadline: .now() + seconds) {
            p.complete(Result(catching: body))
        }
        
        return p.future
    }
}

extension Future {
    
    public func background<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.async(after: seconds, queue: .global(qos: .background), body: body)
    }
    
    public func utility<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.async(after: seconds, queue: .global(qos: .utility), body: body)
    }
    
    public func userInitiated<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.async(after: seconds, queue: .global(qos: .userInitiated), body: body)
    }
    
    public func userInteractive<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.async(after: seconds, queue: .global(qos: .userInteractive), body: body)
    }
    
    public func main<U>(after seconds: Double = 0, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.async(after: seconds, queue: .main, body: body)
    }
    
    private func async<U>(after seconds: Double = 0, queue: DispatchQueue, body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.delay(seconds, on: queue).map(body)
    }
}


