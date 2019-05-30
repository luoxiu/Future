//
//  Future.then.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    @inlinable
    public func then(onSuccess: @escaping (T) -> Void, onFailure: @escaping (Error) -> Void) {
        self.whenComplete { r in
            switch r {
            case .success(let t):
                onSuccess(t)
            case .failure(let e):
                onFailure(e)
            }
        }
    }
}
