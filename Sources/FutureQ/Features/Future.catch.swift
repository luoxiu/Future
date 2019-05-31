//
//  Future.catch.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func `catch`(_ body: @escaping (Error) -> Void) -> Future<Void> {
        let p = Promise<Void>()
        self.whenComplete { r in
            switch r {
            case .success:
                p.succeed(())
            case .failure(let e):
                p.succeed(body(e))
            }
        }
        return p.future
    }
}
