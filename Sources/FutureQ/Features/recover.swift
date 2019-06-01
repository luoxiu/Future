//
//  recover.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    // Alias for mapError
    @inlinable
    public func recover(_ callback: @escaping (Error) -> T) -> Future<T> {
        return self.mapError(callback)
    }
}
