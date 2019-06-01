//
//  Future.filter.swift
//  Alice
//
//  Created by Quentin Jin on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func filter(_ body: @escaping (T) -> Bool) -> Future<T> {
        
        let p = Promise<T>()
        
        self.whenComplete { r in
            switch r {
            case .success(let t):
                if body(t) {
                    p.succeed(t)
                } else {
                    p.fail(FutureError.validate)
                }
            case .failure(let e):
                p.fail(e)
            }
        }
        
        return p.future
    }
    
    public static func filterSuccess<T>(_ futures: [Future<T>]) -> Future<[T]> {
        let p = Promise<[T]>()
        
        let count = Atomic(futures.count)
        
        for f in futures {
            f.whenComplete { _ in
                count.writeVoid { cd in
                    cd -= 1
                    if cd == 0 {
                        p.succeed(futures.compactMap { $0._value })
                    }
                }
            }
        }
        return p.future
    }
    
    public static func filterSuccessAndCompactMap<T, U>(_ futures: [Future<T>], body: @escaping (T) -> U?) -> Future<[U]> {
        let fs = futures.map { $0.mapValue(body) }
        return self.filterSuccess(fs).mapValue { $0.compactMap { $0 } }
    }
}
