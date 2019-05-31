//
//  Future.validate.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

extension Future {
    
    @inlinable
    public func validate(_ body: @escaping (T) -> Bool) -> Future<T> {
        
        let p = Promise<T>()
        
        self.whenComplete { r in
            switch r {
            case .success(let t):
                if body(t) {
                    p.succeed(t)
                } else {
                    p.fail(FutureError.validate(t))
                }
            case .failure(let e):
                p.fail(e)
            }
        }
        
        return p.future
    }
}
