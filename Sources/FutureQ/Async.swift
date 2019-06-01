//
//  Async.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

extension Promise {
    
    public static func background<T>(after seconds: Double = 0, _ body: @escaping () throws -> T) -> Future<T> {
        return self.async(after: seconds, qos: .background, body)
    }
    
    public static func utility<T>(after seconds: Double = 0, _ body: @escaping () throws -> T) -> Future<T> {
        return self.async(after: seconds, qos: .utility, body)
    }
    
    public static func `default`<T>(after seconds: Double = 0, _ body: @escaping () throws -> T) -> Future<T> {
        return self.async(after: seconds, qos: .default, body)
    }
    
    public static func userInitiated<T>(after seconds: Double = 0, _ body: @escaping () throws -> T) -> Future<T> {
        return self.async(after: seconds, qos: .userInitiated, body)
    }
    
    public static func userInteractive<T>(after seconds: Double = 0, _ body: @escaping () throws -> T) -> Future<T> {
        return self.async(after: seconds, qos: .userInteractive, body)
    }
    
    private static func async<T>(after seconds: Double = 0, qos: DispatchQoS.QoSClass, _ body: @escaping () throws -> T) -> Future<T> {
        let q = DispatchQueue.global(qos: qos)

        if seconds == 0 {
            return Future<T>(result: Result(catching: body)).yield(on: q)
        }

        let p = Promise<T>()
        
        q.asyncAfter(deadline: .now() + seconds) {
            p.complete(Result(catching: body))
        }
        
        return p.future
    }
}

extension Future {
    
    public func background<U>(after seconds: Double = 0, _ body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, qos: .background, body)
    }
    
    public func utility<U>(after seconds: Double = 0, _ body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, qos: .utility, body)
    }
    
    public func `default`<U>(after seconds: Double = 0, _ body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, qos: .default, body)
    }
    
    public func userInitiated<U>(after seconds: Double = 0, _ body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, qos: .userInitiated, body)
    }
    
    public func userInteractive<U>(after seconds: Double = 0, _ body: @escaping (T) throws -> U) -> Future<U> {
        return self.async(after: seconds, qos: .userInteractive, body)
    }
    
    private func async<U>(after seconds: Double = 0, qos: DispatchQoS.QoSClass, _ body: @escaping (T) throws -> U) -> Future<U> {
        let q = DispatchQueue.global(qos: qos)
        
        if seconds == 0 {
            return self.mapValue(body)
        }
        
        return self.delay(seconds, on: q).mapValue(body)
    }
}



