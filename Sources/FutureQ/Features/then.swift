//
//  then.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    // Alias for whenComplete
    @inlinable
    public func then(_ callback: @escaping (Result<Success, Failure>) -> Void) {
        self.whenComplete(callback)
    }
    
    // Alias for flatMapValue
    @inlinable
    public func then<U>(_ body: @escaping (Success) -> Future<U, Failure>) -> Future<U, Failure> {
        return self.flatMapValue(body)
    }
    
    // Alias for mapValue
    @inlinable
    public func thenReturn<U>(_ body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.map(body)
    }
}
