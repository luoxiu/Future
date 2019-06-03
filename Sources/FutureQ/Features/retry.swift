//
//  retry.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

extension Thenable {
    
    public static func retry<T>(_ count: Int, _ task: () throws -> T) -> Future<T> {
        return retry(Promise<T>(), count, task)
    }
    
    static func retry<T>(_ promise: Promise<T>, _ count: Int, _ task: () throws -> T) -> Future<T> {
        
        guard count >= 1 else {
            promise.fail(FutureError.input)
            return promise.future
        }
        
        do {
            promise.succeed(try task())
        } catch let e {
            if count == 0 {
                promise.fail(e)
            } else {
                return self.retry(promise, count - 1, task)
            }
        }
        
        return promise.future
    }
}
