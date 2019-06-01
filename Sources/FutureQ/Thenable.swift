//
//  Thenable.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

public protocol Thenable {
    
    associatedtype T
    
    func whenComplete(_ callback: @escaping (Result<T, Error>) -> Void)
    
    func inspect() -> Result<T, Error>?
    
    func inspectWildly() -> Result<T, Error>?
}

extension Thenable {
    
    @inlinable
    public func whenSuccess(_ callback: @escaping (T) -> Void) {
        self.whenComplete { r in
            if case .success(let t) = r {
                callback(t)
            }
        }
    }
    
    @inlinable
    public func whenFailure(_ callback: @escaping (Error) -> Void) {
        self.whenComplete { r in
            if case .failure(let e) = r {
                callback(e)
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
