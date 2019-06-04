//
//  map.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func map<U>(_ body: @escaping (Success) -> U) -> Future<U, Failure> {
        let p = Promise<U, Failure>()
        self.whenComplete { r in
            switch r {
            case .success(let t):
                p.succeed(body(t))
            case .failure(let e):
                p.fail(e)
            }
        }
        return p.future
    }
    
    @inlinable
    public func mapError<E>(_ body: @escaping (Error) -> E) -> Future<Success, E> {
        let p = Promise<Success, E>()
        self.whenComplete { r in
            switch r {
            case .success(let t):
                p.succeed(t)
            case .failure(let e):
                p.fail(body(e))
            }
        }
        return p.future
    }
}
