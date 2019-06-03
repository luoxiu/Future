//
//  Future.wait.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func wait() -> Result<T, Error> {
        let sema = DispatchSemaphore(value: 0)
        self.whenSuccess { _ in
            sema.signal()
        }
        sema.wait()

        return self.inspectWildly()!
    }
    
    @inlinable
    public func waitValue() -> T? {
        return self.wait().value
    }
    
    @inlinable
    public func waitError() -> Error? {
        return self.wait().error
    }
}
