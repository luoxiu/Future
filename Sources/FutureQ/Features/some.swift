//
//  Future.some.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func some(_ futures: [Future<T>], count: Int) -> Future<[T]> {
        guard count > 0 else {
            return Future<[T]>.failure(FutureError.input)
        }
        
        let p = Promise<[T]>()
        
        var vals: [T] = []
        vals.reserveCapacity(count)

        let atomicVals = Atomic(vals)
        
        for f in futures {
            f.whenSuccess { t in
                atomicVals.writeVoid { ts in
                    if ts.count == count {
                        p.succeed(atomicVals.snapshot())
                    } else {
                        ts.append(t)
                    }
                }
            }
        }
        
        return p.future
    }
}
