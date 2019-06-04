//
//  pipe.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func pipe(to promise: Promise<Success, Failure>) {
        self.whenComplete(promise.complete)
    }
    
    @inlinable
    public func pipeSuccess(to promise: Promise<Success, Failure>) {
        self.whenSuccess(promise.succeed)
    }
    
    @inlinable
    public func pipeFailure(to promise: Promise<Success, Failure>) {
        self.whenFailure(promise.fail)
    }
}
