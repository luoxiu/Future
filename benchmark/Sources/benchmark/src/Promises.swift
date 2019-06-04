//
//  Promises.swift
//  benchmark
//
//  Created by Quentin Jin on 2019/5/31.
//  Copyright © 2019 Quentin Jin. All rights reserved.
//

import Foundation
import Promises

class TestPromises: Test {
    
    func testSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let time = benchmark(TIMES) {
            Promise<Bool>(true).then(on: q) { _ in
                s.signal()
            }
            s.wait()
        }
        
        Log("promises serial queue", time)
    }
    
    func testDoubleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let time = benchmark(TIMES) {
            Promise<Bool>(true)
                .then(on: q) { _ in
                }
                .then(on: q) { _ in
                    s.signal()
            }
            
            s.wait()
        }
        
        Log("promises double serial queue", time)
    }
    
    func testTripleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let time = benchmark(TIMES) {
            Promise<Bool>(true)
                .then(on: q) { _ in
                }
                .then(on: q) { _ in
                }
                .then(on: q) { _ in
                    s.signal()
            }
            
            s.wait()
        }
        
        Log("promises triple serial queue", time)
    }
    
    func testConcurrentQueue() {
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated, attributes: .concurrent)
        let g = DispatchGroup()
        
        var promises: [Promise<Bool>] = []
        
        for _ in 0..<TIMES {
            g.enter()
            let promise = Promise<Bool>.pending()
            promise.then(on: q) { _ in
                g.leave()
            }
            promises.append(promise)
        }
        
        let time = benchmark(1) {
            for promise in promises {
                promise.fulfill(true)
            }
            
            g.wait()
        }
        
        Log("promises concurrent queue", time / TIMES)
    }
}
