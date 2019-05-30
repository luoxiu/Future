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
    public init(on queue: DispatchQueue = .main) {
        self.future = Future<T>(on: queue)
    }
    
    @inlinable
    public func succeed(_ value: T) {
        self.future.complete(.success(value))
    }
    
    @inlinable
    public func fail(_ error: Error) {
        self.future.complete(.failure(error))
    }
}
