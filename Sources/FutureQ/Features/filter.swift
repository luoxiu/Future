//
//  filter.swift
//  Alice
//
//  Created by Quentin Jin on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func filter(customError: CustomError<Failure>? = nil, _ body: @escaping (Success) -> Bool) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete { r in
            switch r {
            case .success(let s):
                if body(s) {
                    p.succeed(s)
                } else {
                    if let e = customError?() {
                        p.fail(e)
                    }
                }
            case .failure(let e):
                p.fail(e)
            }
        }
        
        return p.future
    }
}
