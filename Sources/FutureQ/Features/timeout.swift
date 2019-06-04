//
//  timeout.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func timeout(_ seconds: TimeInterval, on queue: DispatchQueue = .main, customError: @escaping CustomError<Failure>) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        queue.asyncAfter(deadline: .now() + seconds) {
            p.fail(customError())
        }
        return p.future
    }
    
    @inlinable
    public func timeout(_ seconds: TimeInterval, on queue: DispatchQueue = .main, customError: Failure) -> Future<Success, Failure> {
        return self.timeout(seconds, on: queue, customError: { customError })
    }
}
