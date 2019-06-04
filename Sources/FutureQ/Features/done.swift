//
//  done.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

extension Thenable {
    
    // Alias for `mapValue { _ -> Void in }`
    @inlinable
    public func done(_ body: @escaping (Success) -> Void) -> Future<Success, Failure> {
        return self.map {
            body($0)
            return $0
        }
    }
}
