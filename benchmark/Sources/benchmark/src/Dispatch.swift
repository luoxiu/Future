//
//  Dispatch.swift
//  benchmark
//
//  Created by Quentin Jin on 2019/5/31.
//  Copyright © 2019 Quentin Jin. All rights reserved.
//

import Foundation

class TestDispatch {
    
    func testSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let time = benchmark(TIMES) {
            q.async {
                s.signal()
            }
            s.wait()
        }
        
        Log("dispatch serial queue", time)
    }
    
    func testDoubleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let time = benchmark(TIMES) {
            q.async {
                q.async {
                    s.signal()
                }
            }
            s.wait()
        }
        
        Log("dispatch double serial queue", time)
    }
    
    func testTripleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let time = benchmark(TIMES) {
            q.async {
                q.async {
                    q.async {
                        s.signal()
                    }
                }
            }
            s.wait()
        }
        
        Log("dispatch triple serial queue", time)
    }
    
    func testConcurrentQueue() {
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated, attributes: .concurrent)
        let g = DispatchGroup()
        
        var bodys: [() -> Void] = []
        
        for _ in 0..<TIMES {
            g.enter()
            bodys.append {
                q.async {
                    g.leave()
                }
            }
        }

        let time = benchmark(1) {
            for body in bodys {
                body()
            }
            g.wait()
        }

        Log("dispatch concurrent queue", time / TIMES)
    }
}
