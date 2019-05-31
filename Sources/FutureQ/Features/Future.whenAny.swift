//
//  Future.whenAny.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func whenAnyComplete<T>(_ futures: [Future<T>]) -> Future<T> {
        let p = Promise<T>()
        for f in futures {
            f.pipe(to: p)
        }
        return p.future
    }
    
    public static func whenAnySucceed<T>(_ futures: [Future<T>]) -> Future<T> {
        let p = Promise<T>()
        for f in futures {
            f.pipeSuccess(to: p)
        }
        return p.future
    }
}
