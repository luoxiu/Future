//
//  Helpers.swift
//  benchmark
//
//  Created by Quentin MED on 2019/5/31.
//  Copyright © 2019 Quentin MED. All rights reserved.
//

import Foundation

func benchmark(_ times: UInt64, _ body: () -> Void) -> UInt64 {
    let timestamp = DispatchTime.now().uptimeNanoseconds
    for _ in 0..<times {
        body()
    }
    let i = DispatchTime.now().uptimeNanoseconds - timestamp
    return i / times
}

let TIMES: UInt64 = 10_000

func Log(_ title: String, _ time: UInt64) {
    print("\(title): \(time)")
}
