//
//  some.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public static func some<S: Sequence>(_ thenables: S, count: Int) -> Future<[S.Element.Success], S.Element.Failure> where S.Element: Thenable {
        precondition(count > 0, "bad input")
        
        let p = Promise<[S.Element.Success], S.Element.Failure>()
        
        var vals: [S.Element.Success] = []
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
