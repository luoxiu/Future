//
//  filter.swift
//  Alice
//
//  Created by Quentin Jin on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func filter(_ body: @escaping (Success) -> Bool) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete { r in
            switch r {
            case .success(let t):
                if body(t) {
                    p.succeed(t)
                }
            case .failure(let e):
                p.fail(e)
            }
        }
        
        return p.future
    }
}
