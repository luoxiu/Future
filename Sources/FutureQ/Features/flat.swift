//
//  flat.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

extension Thenable where Success: Thenable, Success.Failure == Failure {
    
    public func flat() -> Future<Success.Success, Failure> {
        return self.flatMap { $0.toFuture() }
    }
}
