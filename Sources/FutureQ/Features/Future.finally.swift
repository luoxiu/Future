//
//  Future.finally.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func finally(_ body: @escaping () -> Void) -> Future<Void> {
        let promise = Promise<Void>()
        
        self.whenComplete { _ in
            body()
            promise.succeed(())
        }
        
        return promise.future
    }
}
