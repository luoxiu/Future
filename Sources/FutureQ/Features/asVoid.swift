//
//  asVoid.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func asVoid() -> Future<Void, Failure> {
        return self.map { _ in () }
    }
}
