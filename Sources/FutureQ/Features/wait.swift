//
//  Future.wait.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func wait() -> Result<Success, Failure> {
        let sema = DispatchSemaphore(value: 0)
        self.whenSuccess { _ in
            sema.signal()
        }
        sema.wait()

        return self.inspectRoughly()!
    }
    
    @inlinable
    public func waitValue() -> Success? {
        return self.wait().value
    }
    
    @inlinable
    public func waitError() -> Failure? {
        return self.wait().error
    }
}
