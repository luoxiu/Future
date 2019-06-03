//
//  Promise.swift
//  SwiftDemo
//
//  Created by Quentin MED on 2019/3/26.
//  Copyright © 2019 Quentin. All rights reserved.
//

import Foundation

public struct Promise<T> {
    
    public let future: Future<T>
    
    @inlinable
    public init() {
        self.future = Future<T>()
    }
    
    @inlinable
    public func complete(_ result: Result<T, Error>) {
        self.future.complete(result)
    }
}

extension Promise {
    
    @inlinable
    public func succeed(_ value: T) {
        self.future.complete(.success(value))
    }
    
    @inlinable
    public func fail(_ error: Error) {
        self.future.complete(.failure(error))
    }
    
    @inlinable
    public static func pending() -> Promise {
        return Promise()
    }
    
    @inlinable
    public static func pendingVoid() -> Promise<Void> {
        return Promise<Void>()
    }
}
