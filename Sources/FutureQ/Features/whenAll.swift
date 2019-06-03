//
//  Future.all.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public static func whenAllComplete<C: Collection>(_ thenables: C) -> Future<[Result<C.Element.T, Error>]> where C.Element: Thenable {
        let p = Promise<[Result<C.Element.T, Error>]>()
        
        let count = Atomic(thenables.count)
        
        for t in thenables {
            t.whenComplete { _ in
                count.writeVoid { cd in
                    cd -= 1
                    if cd == 0 {
                        p.succeed(thenables.map({ $0.inspectWildly()! }))
                    }
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public static func whenAllComplete<T: Thenable>(_ thenables: T...) -> Future<[Result<T.T, Error>]> {
        return self.whenAllComplete(thenables)
    }
    
    @inlinable
    public static func whenAllSucceed<C: Collection>(_ thenables: C) -> Future<[C.Element.T]> where C.Element: Thenable {
        let p = Promise<[C.Element.T]>()
        
        let count = Atomic(thenables.count)
        
        for t in thenables {
            t.whenComplete { r in
                switch r {
                case .success:
                    count.writeVoid { cd in
                        cd -= 1
                        if cd == 0 {
                            p.succeed(thenables.map({ $0.inspectWildly()!.value! }))
                        }
                    }
                case .failure(let e):
                    p.fail(e)
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public static func whenAllSucceed<T: Thenable>(_ thenables: T...) -> Future<[T.T]> {
        return self.whenAllSucceed(thenables)
    }
}
