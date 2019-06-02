//
//  whenAny.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    public static func whenAnyComplete<T: Thenable>(_ thenables: [T]) -> Future<T.T> {
        let p = Promise<T.T>()
        for t in thenables {
            t.pipe(to: p)
        }
        return p.future
    }
    
    public static func whenAnySucceed<T: Thenable>(_ thenables: [T]) -> Future<T.T> {
        let p = Promise<T.T>()
        for t in thenables {
            t.pipeSuccess(to: p)
        }
        return p.future
    }
}
