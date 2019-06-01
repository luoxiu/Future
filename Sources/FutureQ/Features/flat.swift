//
//  flat.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

extension Thenable where T: Thenable {
    
    public func flat() -> Future<T.T> {
        return self.flatMapValue {
            $0.toFuture()
        }
    }
}
