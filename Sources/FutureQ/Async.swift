//
//  Async.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/5/31.
//

import Foundation

func fn() {
    
    func fetch() -> Future<Int> {
        return .success(1)
    }
}
