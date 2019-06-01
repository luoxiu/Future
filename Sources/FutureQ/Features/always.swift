//
//  always.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func always(_ body: @escaping () -> Void) -> Future<Void> {
        return self.map { _ in body() }
    }
}
