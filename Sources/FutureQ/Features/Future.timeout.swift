//
//  Future.timeout.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func timeout(_ interval: TimeInterval) -> Future<T> {
        let promise = Promise<T>(on: self.queue)
        self.queue.asyncAfter(deadline: .now() + interval) {
            promise.fail(FutureError.timeout)
        }
        return promise.future
    }
}
