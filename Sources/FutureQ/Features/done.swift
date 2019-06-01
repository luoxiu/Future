//
//  done.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

extension Thenable {
    
    // Alias for `mapValue { _ -> Void in }`
    @discardableResult
    @inlinable
    public func done(_ body: @escaping (T) -> Void) -> Future<Void> {
        return self.mapValue { body($0) }
    }
}
