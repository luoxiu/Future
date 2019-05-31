//
//  Future.tap.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func tap(_ callback: @escaping (T) -> Void) -> Future<T> {
        self.whenSuccess(callback)
        return self
    }
    
    @inlinable
    public func tapError(_ callback: @escaping (Error) -> Void) -> Future<T> {
        self.whenFailure(callback)
        return self
    }
}
