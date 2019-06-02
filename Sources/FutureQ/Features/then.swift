//
//  then.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func then(_ callback: @escaping (Result<T, Error>) -> Void) {
        self.whenComplete(callback)
    }
    
    // Alias for flatMapValue
    @inlinable
    public func then<U: Thenable>(_ body: @escaping (T) -> U) -> Future<U.T> {
        return self.flatMapValue(body)
    }
    
    // Alias for mapValue
    @inlinable
    public func thenReturn<U>(_ body: @escaping (T) throws -> U) -> Future<U> {
        return self.mapValue(body)
    }
}
