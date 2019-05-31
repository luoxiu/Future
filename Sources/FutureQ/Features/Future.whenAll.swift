//
//  Future.all.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func whenAllComplete<T>(on queue: DispatchQueue = .main, _ futures: [Future<T>]) -> Future<[Result<T, Error>]> {
        let p = Promise<[Result<T, Error>]>()
        
        let count = futures.count
        var vals: [Result<T, Error>] = []
        vals.reserveCapacity(count)
        
        var complete = false
        let atomicVals = Atomic(vals)
        
        for f in futures {
            f.whenComplete { r in
                atomicVals.writeVoid { rs in
                    switch rs.count {
                    case 0..<count:
                        rs.append(r)
                    case count:
                        complete = true
                    default:
                        break
                    }
                }
                if complete {
                    p.succeed(atomicVals.snapshot())
                }
            }
        }
        
        return p.future
    }
    
    public static func whenAllSucceed<T>(on queue: DispatchQueue = .main, _ futures: [Future<T>]) -> Future<[T]> {
        let p = Promise<[T]>()
        
        let count = futures.count
        var vals: [T] = []
        vals.reserveCapacity(count)
        
        var succeed = false
        let atomicVals = Atomic(vals)
        
        for f in futures {
            f.whenComplete { r in
                switch r {
                case .success(let t):
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
                case .failure(let e):
                    p.fail(e)
                }
            }
        }
        
        return p.future
    }
}
