//
//  main.swift
//  benchmark
//
//  Created by Quentin Jin on 2019/5/31.
//  Copyright © 2019 Quentin Jin. All rights reserved.
//

import Foundation

func benchmark(_ times: Int, _ body: () -> Void) -> UInt64 {
    let timestamp = DispatchTime.now().uptimeNanoseconds
    for _ in 0..<times {
        body()
    }
    let i = DispatchTime.now().uptimeNanoseconds - timestamp
    return i / UInt64(times)
}

