import Foundation

extension Thenable {
    
    @inlinable
    public static func some<S: Sequence>(_ thenables: S, count: Int) -> Future<[S.Element.Success], S.Element.Failure> where S.Element: Thenable {
        let p = Promise<[S.Element.Success], S.Element.Failure>()
        
        var vals: [S.Element.Success] = []
        vals.reserveCapacity(count)

        let atomicVals = Atom(vals)
        
        for f in thenables {
            f.whenSucceed { s in
                let after = atomicVals.append(s)
                if after.count == count {
                    p.succeed(after)
                }
            }
        }
        
        return p.future
    }
}
