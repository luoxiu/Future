//
//  DispatchQueue+.swift
//  HTTP
//
//  Created by Quentin Jin on 2019/5/18.
//

import Foundation

extension DispatchQueue {
    
    public func makePromise<T>() -> Promise<T> {
        return Promise<T>(on: self)
    }
    
    public func makeFuture<T>(body: @escaping () throws -> T) -> Future<T> {
        let promise: Promise<T> = self.makePromise()
        self.async {
            do {
                let t = try body()
                promise.succeed(t)
            } catch {
                promise.fail(error)
            }
        }
        return promise.future
    }
}
