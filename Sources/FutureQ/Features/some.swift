//
//  some.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public static func some<S: Sequence>(_ thenables: S, count: Int) -> Future<[S.Element.T]> where S.Element: Thenable {
        guard count > 0 else {
            return Future<[S.Element.T]>.failure(FutureError.input)
        }
        
        let p = Promise<[S.Element.T]>()
        
        var vals: [S.Element.T] = []
        vals.reserveCapacity(count)

        let atomicVals = Atomic(vals)
        
        for f in thenables {
            f.whenSuccess { t in
                atomicVals.writeVoid { ts in
                    if ts.count == count {
                        p.succeed(ts)
                    } else {
                        ts.append(t)
                    }
                }
            }
        }
        
        return p.future
    }
}
