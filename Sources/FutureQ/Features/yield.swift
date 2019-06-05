//
//  yield.swift
//  FutureQ
//
//  Created by Quentin MED on 2019/6/3.
//

import Foundation

extension Thenable {
    
    public func yield(on queue: DispatchQueue) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete { r in
            queue.async {
                p.complete(r)
            }
        }
        
        return p.future
    }
    
    public func yield(on scheduler: Scheduler) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete { r in
            scheduler.schedule {
                p.complete(r)
            }
        }
        
        return p.future
    }
}
