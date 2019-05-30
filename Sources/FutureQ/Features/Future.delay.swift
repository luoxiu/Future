//
//  Future.delay.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func delay(_ interval: TimeInterval, on queue: DispatchQueue) -> Future<T> {
        let p = Promise<T>(on: self.queue)
        self.whenComplete { r in
            queue.asyncAfter(deadline: .now() + interval) {
                switch r {
                case .success(let t):
                    p.succeed(t)
                case .failure(let e):
                    p.fail(e)
                }
            }
        }
        return p.future
    }
}
