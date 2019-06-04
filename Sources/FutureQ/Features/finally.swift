//
//  finally.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    // Alias for `always`
    @inlinable
    public func finally(_ body: @escaping () -> Void) -> Future<Success, Failure> {
        return self.always(body)
    }
}
