//
//  Async.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

public typealias Async = Future<Void>

extension Future where T == Void {
    
    public static func background<U>(after seconds: Double = 0, body: @escaping () -> U) -> Future<U> {
        return self.async(after: seconds, queue: .global(qos: .background), body: body)
    }
    
    public static func utility<U>(after seconds: Double = 0, body: @escaping () throws -> U) -> Future<U> {
        return self.async(after: seconds, queue: .global(qos: .utility), body: body)
    }
    
    public static func userInitiated<U>(after seconds: Double = 0, body: @escaping () throws -> U) -> Future<U> {
        return self.async(after: seconds, queue: .global(qos: .userInitiated), body: body)
    }
    
    public static func userInteractive<U>(after seconds: Double = 0, body: @escaping () throws -> U) -> Future<U> {
        return self.async(after: seconds, queue: .global(qos: .userInteractive), body: body)
    }
    
    public static func main<U>(after seconds: Double = 0, body: @escaping () throws -> U) -> Future<U> {
        return self.async(after: seconds, queue: .main, body: body)
    }
    
    private static func async<U>(after seconds: Double = 0, queue: DispatchQueue, body: @escaping () throws -> U) -> Future<U> {
        let p = Promise<U>()
        
        queue.asyncAfter(deadline: .now() + seconds) {
            p.complete(Result(catching: body))
        }
        
        return p.future
    }
}

extension Future {
    
    public func background<U>(after seconds: Double = 0, body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, queue: .global(qos: .background), body: body)
    }
    
    public func utility<U>(after seconds: Double = 0, body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, queue: .global(qos: .utility), body: body)
    }
    
    public func userInitiated<U>(after seconds: Double = 0, body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, queue: .global(qos: .userInitiated), body: body)
    }
    
    public func userInteractive<U>(after seconds: Double = 0, body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, queue: .global(qos: .userInteractive), body: body)
    }
    
    public func main<U>(after seconds: Double = 0, body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, queue: .main, body: body)
    }
    
    private func async<U>(after seconds: Double = 0, queue: DispatchQueue, body: @escaping (T) throws -> U) -> Future<U> {
        return self.delay(seconds, on: queue).mapValue(body)
    }
}
