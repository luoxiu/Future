//
//  Future.flatmap.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func flatMap<U>(_ body: @escaping (Result<T, Error>) -> Future<U>) -> Future<U> {
        let p = Promise<U>()
        self.whenComplete { r in
            body(r).pipe(to: p)
        }
        return p.future
    }
    
    @inlinable
    public func flatMapValue<U>(_ body: @escaping (T) -> Future<U>) -> Future<U> {
        let p = Promise<U>()
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
    public func flatMapError(_ body: @escaping (Error) -> Future<T>) -> Future<T> {
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
