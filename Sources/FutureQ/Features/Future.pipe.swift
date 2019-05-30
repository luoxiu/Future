//
//  Future.pipe.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func pipe(to promise: Promise<T>?) {
        guard let p = promise else { return }
        self.whenComplete { r in
            switch r {
            case .success(let t):   p.succeed(t)
            case .failure(let e):   p.fail(e)
            }
        }
    }
    
    @inlinable
    public func pipeSuccess(to promise: Promise<T>?) {
        guard let p = promise else { return }
        self.whenSuccess { p.succeed($0) }
    }
    
    @inlinable
    public func pipeFailure(to promise: Promise<T>?) {
        guard let p = promise else { return }
        self.whenFailure { p.fail($0) }
    }
}
