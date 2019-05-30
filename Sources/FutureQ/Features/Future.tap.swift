//
//  Future.tap.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func tap(_ callback: @escaping (T) -> Void) -> Future<T> {
        return self.map { t in
            callback(t)
            return t
        }
    }
    
    @inlinable
    public func tapError(_ callback: @escaping (Error) -> Void) -> Future<T> {
        return self.mapError { e -> Error in
            callback(e)
            return e
        }
    }
}
