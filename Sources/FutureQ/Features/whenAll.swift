//
//  Future.all.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    public static func whenAllComplete<T: Thenable>(_ thenables: [T]) -> Future<[Result<T.T, Error>]> {
        let p = Promise<[Result<T.T, Error>]>()
        
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
    
    public static func whenAllSucceed<T: Thenable>(_ thenables: [T]) -> Future<[T.T]> {
        let p = Promise<[T.T]>()
        
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
}
