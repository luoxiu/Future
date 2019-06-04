//
//  validate.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func validate(customError: @escaping CustomError<Failure>, _ body: @escaping (Success) -> Bool) -> Future<Success, Failure> {

        let p = Promise<Success, Failure>()
        
        self.whenComplete { r in
            switch r {
            case .success(let s):
                if body(s) {
                    p.succeed(s)
                } else {
                    p.fail(customError())
                }
            case .failure(let e):
                p.fail(e)
            }
        }
        
        return p.future
    }
    
    @inlinable
    public func validate(customError: Failure, _ body: @escaping (Success) -> Bool) -> Future<Success, Failure> {
        return self.validate(customError: { customError }, body)
    }
}
