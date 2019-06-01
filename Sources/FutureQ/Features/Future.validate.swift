//
//  Future.validate.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

extension Future {
    
    // Alias for `whenAnyComplete`.
    @inlinable
    public func validate(_ body: @escaping (T) -> Bool) -> Future<T> {
        return self.filter(body)
    }
}
