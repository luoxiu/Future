//
//  Future.yield.swift
//  Future
//
//  Created by Quentin MED on 2019/4/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func yield(on queue: DispatchQueue) -> Future {
        let p = Promise<T>()
        self.whenComplete { (r) in
            queue.async {
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
