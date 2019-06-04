//
//  delay.swift
//  FutureQ
//
//  Created by Quentin MED on 2019/5/31.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func delay(_ seconds: Double, on queue: DispatchQueue) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        self.whenComplete { r in
            queue.asyncAfter(deadline: .now() + seconds) {
                p.complete(r)
            }
        }
        return p.future
    }
}
