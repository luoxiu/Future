//
//  Future.delay.swift
//  FutureQ
//
//  Created by Quentin MED on 2019/5/31.
//

import Foundation

extension Future {
    
    @inlinable
    public func delay(_ interval: TimeInterval, on queue: DispatchQueue) -> Future<T> {
        let p = Promise<T>()
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
