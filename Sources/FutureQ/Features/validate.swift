//
//  validate.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func validate(customError: (() -> Failure)? = nil, _ body: @escaping (Success) -> Bool) -> Future<Success, Failure> {

        let p = Promise<Success, Failure>()
        
        self.whenComplete { r in
            switch r {
            case .success(let t):
                if body(t) {
                    p.succeed(t)
                } else {
                    if let e = customError?() {
                        p.fail(e)
                    } else {
                        fatalError("Validation Failed")
                    }
                }
            case .failure(let e):
                p.fail(e)
            }
        }
        
        return p.future
    }
}
