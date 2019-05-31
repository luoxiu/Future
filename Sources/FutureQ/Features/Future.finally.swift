//
//  Future.finally.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func finally(_ callback: @escaping () -> Void) -> Future<Void> {
        let promise = Promise<Void>()
        
        self.whenComplete { _ in
            callback()
            promise.succeed(())
        }
        
        return promise.future
    }
}
