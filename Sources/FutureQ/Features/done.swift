//
//  done.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/4.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func done(_ body: @escaping (Success) -> Void) -> Future<Success, Failure> {
        return self.map {
            body($0)
            return $0
        }
    }
}
