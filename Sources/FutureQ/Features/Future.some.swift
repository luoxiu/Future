//
//  Future.some.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func some(on queue: DispatchQueue = .main, _ futures: [Future<T>], count: Int) -> Future<[T]> {
        let p = Promise<[T]>()
        
        var vals: [T] = []
        vals.reserveCapacity(count)

        var succeed = false
        let atomicVals = Atomic(vals)
        
        for f in futures {
            f.whenSuccess { t in
                atomicVals.writeVoid { ts in
                    switch ts.count {
                    case 0..<count:
                        ts.append(t)
                    case count:
                        succeed = true
                    default:
                        break
                    }
                }
                
                if succeed {
                    p.succeed(atomicVals.snapshot())
                }
            }
        }
        
        return p.future
    }
}
