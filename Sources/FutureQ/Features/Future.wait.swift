//
//  Future.wait.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func wait() throws -> T {
        
        if DispatchQueue.isRunningOn(self.queue) {
            throw FutureError.deadlock
        }
        
        let sema = DispatchSemaphore(value: 0)
        self.whenComplete { _ in
            sema.signal()
        }
        sema.wait()
        
        return try self._result!.get()
    }
}
