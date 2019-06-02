//
//  Hydra.swift
//  benchmark
//
//  Created by Quentin Jin on 2019/6/2.
//  Copyright © 2019 Quentin MED. All rights reserved.
//

import Foundation
import Hydra

class TestHydra {
    
    func testSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let ctx = Context.custom(queue: q)
        
        let time = benchmark(TIMES) {
            Promise<Bool>(resolved: true)
                .then(in: ctx) { _ in
                    s.signal()
                }
            s.wait()
        }
        
        Log("hydra serial queue", time)
    }
    
    func testDoubleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let ctx = Context.custom(queue: q)
        
        let time = benchmark(TIMES) {
            Promise<Bool>.init(resolved: true)
                .then(in: ctx) {
                    $0
                }
                .then(in: ctx) { _ in
                    s.signal()
                }
            
            s.wait()
        }
        
        Log("hydra double serial queue", time)
    }
    
    func testTripleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let ctx = Context.custom(queue: q)
        
        let time = benchmark(TIMES) {
            Promise<Bool>.init(resolved: true)
                .then(in: ctx) {
                    $0
                }
                .then(in: ctx) {
                    $0
                }
                .then(in: ctx) { _ in
                    s.signal()
                }
            
            s.wait()
        }
        
        Log("hydra triple serial queue", time)
    }
    
    func testConcurrentQueue() {

        Log("hydra concurrent queue(N/A)", 0)
    }

}
