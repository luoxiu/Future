//
//  timeout.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func timeout(_ seconds: TimeInterval, on queue: DispatchQueue = .main) -> Future<T> {
        let promise = Promise<T>()
        queue.asyncAfter(deadline: .now() + seconds) {
            promise.fail(FutureError.timeout)
        }
        return promise.future
    }
}
