//
//  PromiseKit.swift
//  benchmark
//
//  Created by Quentin Jin on 2019/5/31.
//  Copyright © 2019 Quentin Jin. All rights reserved.
//

import Foundation
import PromiseKit

class TestPromiseKit {
    
    func testSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        DispatchQueue.main.async {
            let time = benchmark(TIMES) {
                Promise<Bool>.value(true)
                    .done(on: q) { _ in
                        s.signal()
                    }
                s.wait()
            }
            
            print("promisekit serial queue", time)
        }
    }
    
    func testDoubleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        DispatchQueue.main.async {
            let time = benchmark(TIMES) {
                Promise<Bool>.value(true)
                    .map(on: q) {
                        $0
                    }
                    .done(on: q) { _ in
                        s.signal()
                    }
                
                s.wait()
            }
            
            print("promisekit double serial queue", time)
        }
    }
    
    func testTripleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        DispatchQueue.main.async {
            let time = benchmark(TIMES) {
                Promise<Bool>.value(true)
                    .map(on: q) {
                        $0
                    }
                    .map(on: q) {
                        $0
                    }
                    .done(on: q) { _ in
                        s.signal()
                    }
                
                s.wait()
            }
            
            print("promisekit triple serial queue", time)
        }
    }
    
    func testConcurrentQueue() {
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated, attributes: .concurrent)
        let g = DispatchGroup()
        
        var pendings: [(Promise<Bool>, Resolver<Bool>)] = []
        
        for _ in 0..<TIMES {
            g.enter()
            let pending = Promise<Bool>.pending()
            pending.0.done(on: q) { _ in
                g.leave()
            }
            pendings.append(pending)
        }
        
        let time = benchmark(1) {
            for pending in pendings {
                pending.1.fulfill(true)
            }
            
            g.wait()
        }
        
        print("promisekit concurrent queue", time)
    }
}

