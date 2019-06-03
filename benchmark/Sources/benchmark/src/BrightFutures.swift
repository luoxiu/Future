//
//  BrightFutures.swift
//  benchmark
//
//  Created by Quentin Jin on 2019/6/2.
//  Copyright © 2019 Quentin MED. All rights reserved.
//

import Foundation
import BrightFutures

class TestBrightFutures {
    
    func executor(_ q: DispatchQueue) -> ExecutionContext {
        return { task in
            q.async {
                task()
            }
        }
    }
    
    func testSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let exe = executor(q)
        
        let time = benchmark(TIMES) {
            Future<Bool, Never>.init(value: true)
                .onSuccess(exe) { _ in
                    s.signal()
                }
            s.wait()
        }
        
        Log("BrightFutures serial queue", time)
    }
    
    func testDoubleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let exe = executor(q)
        
        let time = benchmark(TIMES) {
            Future<Bool, Never>.init(value: true)
                .map(exe) {
                    $0
                }
                .onSuccess(exe) { _ in
                    s.signal()
                }
                    
            s.wait()
        }
        
        Log("BrightFutures double serial queue", time)
    }
    
    func testTripleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let exe = executor(q)
        
        let time = benchmark(TIMES) {
            Future<Bool, Never>.init(value: true)
                .map(exe) {
                    $0
                }
                .map(exe) {
                    $0
                }
                .onSuccess(exe) { _ in
                    s.signal()
                }
            
            s.wait()
        }
        
        Log("BrightFutures triple serial queue", time)
    }
    
    func testConcurrentQueue() {
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated, attributes: .concurrent)
        let g = DispatchGroup()
        
        let exe = executor(q)
        
        var promises: [Promise<Bool, Error>] = []
        
        for _ in 0..<TIMES {
            g.enter()
            let promise = Promise<Bool, Error>()
            promise.future.onSuccess(exe) { _ in
                g.leave()
            }
            promises.append(promise)
        }
        
        let time = benchmark(1) {
            for promise in promises {
                promise.success(true)
            }
            
            g.wait()
        }
        
        Log("BrightFutures concurrent queue", time / TIMES)
    }
}

