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
        let p = Promise<T>(on: queue)
        self.pipe(to: p)
        return p.future
    }
}
