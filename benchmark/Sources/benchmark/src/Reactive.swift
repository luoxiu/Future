//
//  Reactive.swift
//  benchmark
//
//  Created by Quentin Jin on 2019/6/2.
//  Copyright © 2019 Quentin MED. All rights reserved.
//

import Foundation
import ReactiveSwift

class TestReactive: Test {
    
    func testSerialQueue() {
        
        let s = DispatchSemaphore(value: 0)
        
        let scheduler = QueueScheduler(qos: .userInitiated, name: "", targeting: nil)
        
        let time = benchmark(TIMES) {
            SignalProducer.init(value: true)
                .observe(on: scheduler)
                .startWithValues({ (_) in
                    s.signal()
                })
            s.wait()
        }
        
        Log("reactive serial queue", time)
        
    }
    
    func testDoubleSerialQueue() {
        
        let s = DispatchSemaphore(value: 0)
        
        let scheduler = QueueScheduler(qos: .userInitiated, name: "", targeting: nil)
        
        let time = benchmark(TIMES) {
            SignalProducer.init(value: true)
                .observe(on: scheduler)
                .observe(on: scheduler)
                .startWithValues({ (_) in
                    s.signal()
                })
            
            s.wait()
        }
        
        Log("reactive double serial queue", time)
    }
    
    func testTripleSerialQueue() {
        
        let s = DispatchSemaphore(value: 0)
        
        let scheduler = QueueScheduler(qos: .userInitiated, name: "", targeting: nil)
        
        let time = benchmark(TIMES) {
            SignalProducer.init(value: true)
                .observe(on: scheduler)
                .observe(on: scheduler)
                .observe(on: scheduler)
                .startWithValues({ (_) in
                    s.signal()
                })
            
            s.wait()
        }
        
        Log("reactive triple serial queue", time)
    }
    
    class ConcurrentQueueScheduler: Scheduler {
        
        let q: DispatchQueue
        init(_ q: DispatchQueue) {
            self.q = q
        }
        
        @discardableResult
        public func schedule(_ action: @escaping () -> Void) -> Disposable? {
            let d = AnyDisposable()
            
            q.async {
                if !d.isDisposed {
                    action()
                }
            }
            
            return d
        }
    }
    
    func testConcurrentQueue() {
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated, attributes: .concurrent)
        let g = DispatchGroup()
        
        let scheduler = ConcurrentQueueScheduler(q)
        
        var observers: [Signal<Bool, Never>.Observer] = []
        
        for _ in 0..<TIMES {
            g.enter()
            
            let pipe = Signal<Bool, Never>.pipe()
            pipe.output.observe(on: scheduler).observeResult { (_) in
                g.leave()
            }
            observers.append(pipe.input)
        }
        
        let time = benchmark(1) {
            for observer in observers {
                observer.send(value: true)
            }
            
            g.wait()
        }
        
        Log("reactive concurrent queue", time / TIMES)
    }
}


