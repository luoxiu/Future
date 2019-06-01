//
//  Future.always.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

extension Future {
    
    @inlinable
    public func always(_ body: @escaping () -> Void) -> Future<Void> {
        let promise = Promise<Void>()
        
        self.whenComplete { _ in
            body()
            promise.succeed(())
        }
        
        return promise.future
    }
}
