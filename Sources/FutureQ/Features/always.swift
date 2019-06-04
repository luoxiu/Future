//
//  always.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func always(_ body: @escaping () -> Void) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        self.whenComplete {
            body()
            p.complete($0)
        }
        return p.future
    }
}
