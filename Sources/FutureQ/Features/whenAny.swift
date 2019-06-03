//
//  whenAny.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public static func whenAnyComplete<T: Thenable>(_ thenables: [T]) -> Future<T.T> {
        let p = Promise<T.T>()
        for t in thenables {
            t.pipe(to: p)
        }
        return p.future
    }
    
    @inlinable
    public static func whenAnyComplete<T: Thenable>(_ thenables: T...) -> Future<T.T> {
        return self.whenAnyComplete(thenables)
    }
    
    @inlinable
    public static func whenAnySucceed<T: Thenable>(_ thenables: [T]) -> Future<T.T> {
        let p = Promise<T.T>()
        for t in thenables {
            t.pipeSuccess(to: p)
        }
        return p.future
    }
    
    @inlinable
    public static func whenAnySucceed<T: Thenable>(_ thenabls: T...) -> Future<T.T> {
        return self.whenAnySucceed(thenabls)
    }
}
