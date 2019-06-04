//
//  Thenable.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

public protocol Thenable {
    
    associatedtype Success
    associatedtype Failure where Failure: Error
    
    func whenComplete(_ body: @escaping (Result<Success, Failure>) -> Void)
    
    func inspect() -> Result<Success, Failure>?
    
    func inspectRoughly() -> Result<Success, Failure>?
}

extension Thenable {
    
    @inlinable
    public func whenSuccess(_ body: @escaping (Success) -> Void) {
        self.whenComplete { r in
            if case .success(let t) = r {
                body(t)
            }
        }
    }
    
    @inlinable
    public func whenFailure(_ body: @escaping (Failure) -> Void) {
        self.whenComplete { r in
            if case .failure(let e) = r {
                body(e)
            }
        }
    }
    
    @inlinable
    public func inspectValue() -> Success? {
        return self.inspect()?.value
    }
    
    @inlinable
    public func inpectError() -> Failure? {
        return self.inspect()?.error
    }
}

extension Thenable {
    
    @inlinable
    public func toFuture() -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        self.pipe(to: p)
        return p.future
    }
}
