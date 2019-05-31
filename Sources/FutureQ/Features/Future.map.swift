//
//  map.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func map<U>(_ body: @escaping (T) -> U) -> Future<U> {
        
        
        
        let p = Promise<U>(on: self.queue)
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
    public func mapError<E: Error>(_ body: @escaping (Error) -> E) -> Future<T> {
        let p = Promise<T>(on: self.queue)
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
