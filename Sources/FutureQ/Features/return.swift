//
//  return.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

extension Future {
    
    // Alias for thenReturn
    @inlinable
    public func `return`<U>(_ body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.map(body)
    }
}
