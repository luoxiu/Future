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
        let p = Promise<[S.Element.Success], S.Element.Failure>()
        
        var vals: [S.Element.Success] = []
        vals.reserveCapacity(count)

        let atomicVals = Atomic(vals)
        
        for f in thenables {
            f.whenSuccess { s in
                atomicVals.writeVoid { ss in
                    if ss.count == count {
                        p.succeed(ss)
                    } else {
                        ss.append(s)
                    }
                }
            }
        }
        
        return p.future
    }
}
