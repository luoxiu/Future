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
