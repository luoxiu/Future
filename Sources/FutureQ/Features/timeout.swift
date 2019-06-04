//
//  timeout.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func timeout(_ seconds: TimeInterval, on queue: DispatchQueue = .main, customError: (() -> Failure)? = nil) -> Future<Success, Failure> {
        let promise = Promise<Success, Failure>()
        queue.asyncAfter(deadline: .now() + seconds) {
            if let error = customError?() {
                promise.fail(error)
            } else {
                fatalError("Timeout")
            }
        }
        return promise.future
    }
}
