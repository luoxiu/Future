//
//  Future.wait.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func wait() -> T {
        
        let sema = DispatchSemaphore(value: 0)
        self.whenSuccess { _ in
            sema.signal()
        }
        sema.wait()

        return self.inspectWildly()!.value!
    }
}
