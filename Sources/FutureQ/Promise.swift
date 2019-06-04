//
//  Promise.swift
//  SwiftDemo
//
//  Created by Quentin MED on 2019/3/26.
//  Copyright © 2019 Quentin. All rights reserved.
//

import Foundation

// Actually, I was think use "vow" for this.
public typealias PromiseN<Success> = Promise<Success, Never>
public typealias PromiseE<Success> = Promise<Success, Error>

public struct Promise<Success, Failure> where Failure: Error {
    
    public let future: Future<Success, Failure>
    
    @inlinable
    public init() {
        self.future = Future<Success, Failure>()
    }
    
    @inlinable
    public func complete(_ result: Result<Success, Failure>) {
        self.future.complete(result)
    }
}

extension Promise {
    
    @inlinable
    public func succeed(_ success: Success) {
        self.future.complete(.success(success))
    }
    
    @inlinable
    public func fail(_ failure: Failure) {
        self.future.complete(.failure(failure))
    }
}
