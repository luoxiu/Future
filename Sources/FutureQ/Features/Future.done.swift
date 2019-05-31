//
//  Future.done.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

extension Future {
    
    @inlinable
    public func done(_ body: @escaping (T) -> Void) -> Future<Void> {
        return self.map { body($0) }
    }
}
