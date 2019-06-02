//
//  flatmap.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func flatMap<U: Thenable>(_ body: @escaping (Result<T, Error>) -> U) -> Future<U.T> {
        let p = Promise<U.T>()
        self.whenComplete { r in
            body(r).pipe(to: p)
        }
        return p.future
    }
    
    @inlinable
    public func flatMapValue<U: Thenable>(_ body: @escaping (T) -> U) -> Future<U.T> {
        let p = Promise<U.T>()
        self.whenComplete { r in
            switch r {
            case .success(let t):
                body(t).pipe(to: p)
            case .failure(let e):
                p.fail(e)
            }
        }
        return p.future
    }
    
    @inlinable
    public func flatMapError<U: Thenable>(_ body: @escaping (Error) -> U) -> Future<T> where U.T == T {
        let p = Promise<T>()
        self.whenComplete { r in
            switch r {
            case .success(let t):
                p.succeed(t)
            case .failure(let e):
                body(e).pipe(to: p)
            }
        }
        return p.future
    }
}
