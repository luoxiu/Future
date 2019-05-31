//
//  Future.all.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func whenAllComplete<T>(_ futures: [Future<T>]) -> Future<[Result<T, Error>]> {
        let p = Promise<[Result<T, Error>]>()
        
        let count = Atomic(futures.count)
        
        for f in futures {
            f.whenComplete { _ in
                count.writeVoid { cd in
                    cd -= 1
                    if cd == 0 {
                        p.succeed(futures.map({ $0._result! }))
                    }
                }
            }
        }
        
        return p.future
    }
    
    public static func whenAllSucceed<T>(_ futures: [Future<T>]) -> Future<[T]> {
        let p = Promise<[T]>()
        
        let count = Atomic(futures.count)
        
        for f in futures {
            f.whenComplete { r in
                switch r {
                case .success:
                    count.writeVoid { cd in
                        cd -= 1
                        if cd == 0 {
                            p.succeed(futures.map({ $0._value! }))
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
