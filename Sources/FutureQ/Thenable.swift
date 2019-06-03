//
//  Thenable.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

public protocol Thenable {
    
    associatedtype T
    
    func whenComplete(_ body: @escaping (Result<T, Error>) -> Void)
    
    func inspect() -> Result<T, Error>?
    
    func inspectWildly() -> Result<T, Error>?
}

extension Thenable {
    
    @inlinable
    public func whenSuccess(_ body: @escaping (T) -> Void) {
        self.whenComplete { r in
            if case .success(let t) = r {
                body(t)
            }
        }
    }
    
    @inlinable
    public func whenFailure(_ body: @escaping (Error) -> Void) {
        self.whenComplete { r in
            if case .failure(let e) = r {
                body(e)
            }
        }
    }
    
    @inlinable
    public var value: T? {
        return self.inspect()?.value
    }
    
    @inlinable
    public var error: Error? {
        return self.inspect()?.error
    }
}

extension Thenable {
    
    @inlinable
    public func toFuture() -> Future<T> {
        let p = Promise<T>()
        self.pipe(to: p)
        return p.future
    }
}
