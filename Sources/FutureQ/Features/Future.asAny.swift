//
//  Future.asAny.swift
//  Future
//
//  Created by Quentin MED on 2019/4/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func asAny() -> Future<Any> {
        return self.map { $0 }
    }
}
