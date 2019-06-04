//
//  recover.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func recover(_ body: @escaping (Error) -> Success) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete { r in
            switch r {
            case .success(let s):
                p.succeed(s)
            case .failure(let e):
                p.succeed(body(e))
            }
        }
        
        return p.future
    }
}
