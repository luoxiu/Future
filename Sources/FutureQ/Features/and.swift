//
//  and.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/2.
//

import Foundation

extension Thenable {
    
    public func and<U: Thenable>(_ thenable: U) -> Future<(T, U.T)> {
        return Future<(T, U.T)>.whenAllSucceed(self, thenable)
    }
    
    public func and<U>(_ u: U) -> Future<(T, U)> {
        return self.mapValue { ($0, u) }
    }
}
