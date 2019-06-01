//
//  pipe.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func pipe(to promise: Promise<T>?) {
        guard let p = promise else { return }
        self.whenComplete(p.complete)
    }
    
    @inlinable
    public func pipeSuccess(to promise: Promise<T>?) {
        guard let p = promise else { return }
        self.whenSuccess(p.succeed)
    }
    
    @inlinable
    public func pipeFailure(to promise: Promise<T>?) {
        guard let p = promise else { return }
        self.whenFailure(p.fail)
    }
}
