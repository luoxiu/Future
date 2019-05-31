//
//  Future.yield.swift
//  Future
//
//  Created by Quentin MED on 2019/4/28.
//

import Foundation

extension Future {
    
    @inlinable func yield(on scheduler: Scheduler) -> Future {
        let p = Promise<T>()
        self.whenComplete { (r) in
            scheduler.schedule {
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

extension Future {
    
    @inlinable
    public func yield(on queue: DispatchQueue) -> Future {
        return self.yield(on: queue as Scheduler)
    }
    
    @inlinable
    public func yield(on queue: OperationQueue) -> Future {
        return self.yield(on: queue as Scheduler)
    }
    
    @inlinable
    public func yield(on runloop: RunLoop) -> Future {
        return self.yield(on: runloop as Scheduler)
    }
}
