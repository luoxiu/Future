//
//  timeout.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func timeout(_ seconds: TimeInterval, on queue: DispatchQueue = .main) -> Future<Success, FutureError<Failure>> {
        let p = Promise<Success, FutureError<Failure>>()
        queue.asyncAfter(deadline: .now() + seconds) {
            p.fail(.timeout)
        }
        
        self.whenComplete { r in
            switch r {
            case .success(let s):
                p.succeed(s)
            case .failure(let e):
                p.fail(.relay(e))
            }
        }
        
        return p.future
    }
}
