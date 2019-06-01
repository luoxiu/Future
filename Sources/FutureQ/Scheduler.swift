//
//  Scheduler.swift
//  FutureQ
//
//  Created by Quentin MED on 2019/5/31.
//

import Foundation

public protocol Scheduler {
    
    func schedule(_ task: @escaping () -> Void)
}

extension Thenable {
    
    @inlinable
    public func yield(on scheduler: Scheduler) -> Future<T> {
        let p = Promise<T>()
        self.whenComplete { (r) in
            scheduler.schedule {
                p.complete(r)
            }
        }
        return p.future
    }
}

extension DispatchQueue: Scheduler {
    
    public func schedule(_ task: @escaping () -> Void) {
        self.async(execute: task)
    }
}

extension OperationQueue: Scheduler {
    
    public func schedule(_ task: @escaping () -> Void) {
        self.addOperation(task)
    }
}

extension RunLoop: Scheduler {
    
    public func schedule(_ task: @escaping () -> Void) {
        self.perform(task)
    }
}

extension Thenable {
    
    @inlinable
    public func yield(on queue: DispatchQueue) -> Future<T> {
        return self.yield(on: queue as Scheduler)
    }
    
    @inlinable
    public func yield(on queue: OperationQueue) -> Future<T> {
        return self.yield(on: queue as Scheduler)
    }
    
    @inlinable
    public func yield(on runloop: RunLoop) -> Future<T> {
        return self.yield(on: runloop as Scheduler)
    }
}
