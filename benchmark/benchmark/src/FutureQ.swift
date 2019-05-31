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
        
        DispatchQueue.main.async {
            let time = benchmark(TIMES) {
                Future<Bool>(on: q, success: true)
                    .whenSuccess { _ in
                        s.signal()
                    }
                s.wait()
            }
            
            print("futureQ serial queue", time)
        }
    }
    
    func testDoubleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        DispatchQueue.main.async {
            let time = benchmark(TIMES) {
                Future<Bool>(on: q, success: true)
                    .map {
                        $0
                    }
                    .whenSuccess { _ in
                        s.signal()
                    }
                
                s.wait()
            }
            
            print("futureQ double serial queue", time)
        }
    }
    
    func testTripleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        DispatchQueue.main.async {
            let time = benchmark(TIMES) {
                Future<Bool>(on: q, success: true)
                    .map {
                        $0
                    }
                    .map {
                        $0
                    }
                    .whenSuccess { _ in
                        s.signal()
                    }
                
                s.wait()
            }
            
            print("futureQ triple serial queue", time)
        }
    }
    
    func testConcurrentQueue() {
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated, attributes: .concurrent)
        let g = DispatchGroup()
        
        var promises: [Promise<Bool>] = []
        
        for _ in 0..<TIMES {
            g.enter()
            let promise = Promise<Bool>(on: q)
            promise.future.whenSuccess { _ in
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
        
        print("futureQ concurrent queue", time)
    }
}

