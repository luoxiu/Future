//
//  FutureQ.swift
//  benchmark
//
//  Created by Quentin Jin on 2019/5/31.
//  Copyright © 2019 Quentin Jin. All rights reserved.
//

import Foundation
import FutureQ

class TestFutureQ {
    
    func testSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let time = benchmark(TIMES) {
            Future<Bool>(success: true)
                .yield(on: q)
                .whenSuccess { _ in
                    s.signal()
                }
            s.wait()
        }
        
        Log("futureQ serial queue", time)
        
    }
    
    func testDoubleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let time = benchmark(TIMES) {
            Future<Bool>(success: true)
                .yield(on: q)
                .yield(on: q)
                .whenSuccess { _ in
                    s.signal()
                }
            
            s.wait()
        }
        
        Log("futureQ double serial queue", time)
    }
    
    func testTripleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let time = benchmark(TIMES) {
            Future<Bool>(success: true)
                .yield(on: q)
                .yield(on: q)
                .whenSuccess { _ in
                    s.signal()
                }
            
            s.wait()
        }
        
        Log("futureQ triple serial queue", time)
    }
    
    func testConcurrentQueue() {
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated, attributes: .concurrent)
        let g = DispatchGroup()
        
        var promises: [Promise<Bool>] = []
        
        for _ in 0..<TIMES {
            g.enter()
            let promise = Promise<Bool>()
            promise.future.yield(on: q).whenSuccess { _ in
                g.leave()
            }
            promises.append(promise)
        }
        
        let time = benchmark(1) {
            for promise in promises {
                promise.succeed(true)
            }
            
            g.wait()
        }
        
        Log("futureQ concurrent queue", time / TIMES)
    }
}

