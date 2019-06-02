//
//  RxSwift.swift
//  benchmark
//
//  Created by Quentin Jin on 2019/6/2.
//  Copyright © 2019 Quentin MED. All rights reserved.
//

import Foundation
import RxSwift

class TestRxSwift {
    
    let bag = DisposeBag()
    
    func testSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let scheduler = ConcurrentDispatchQueueScheduler.init(queue: q)
        
        let time = benchmark(TIMES) {
            Observable.just(true)
                .observeOn(scheduler)
                .subscribe(onNext: { (_) in
                    s.signal()
                })
                .disposed(by: bag)
            s.wait()
        }
        
        Log("rxswift serial queue", time)
        
    }
    
    func testDoubleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let scheduler = ConcurrentDispatchQueueScheduler.init(queue: q)
        
        let time = benchmark(TIMES) {
            Observable.just(true)
                .observeOn(scheduler)
                .observeOn(scheduler)
                .subscribe(onNext: { (_) in
                    s.signal()
                })
                .disposed(by: bag)
            
            s.wait()
        }
        
        Log("rxswift double serial queue", time)
    }
    
    func testTripleSerialQueue() {
        
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated)
        let s = DispatchSemaphore(value: 0)
        
        let scheduler = ConcurrentDispatchQueueScheduler.init(queue: q)
        
        let time = benchmark(TIMES) {
            Observable.just(true)
                .observeOn(scheduler)
                .observeOn(scheduler)
                .observeOn(scheduler)
                .subscribe(onNext: { (_) in
                    s.signal()
                })
                .disposed(by: bag)
            
            s.wait()
        }
        
        Log("rxswift triple serial queue", time)
    }
    
    func testConcurrentQueue() {
        let q = DispatchQueue(label: UUID().uuidString, qos: .userInitiated, attributes: .concurrent)
        let g = DispatchGroup()
        
        var subjects: [PublishSubject<Bool>] = []
        
        let scheduler = ConcurrentDispatchQueueScheduler(queue: q)
        
        for _ in 0..<TIMES {
            g.enter()
            
            let subject = PublishSubject<Bool>()
            subject
                .observeOn(scheduler)
                .subscribe(onNext: { (_) in
                    g.leave()
                })
                .disposed(by: bag)
            
            subjects.append(subject)
        }
        
        let time = benchmark(1) {
            for subject in subjects {
                subject.onNext(true)
            }
            
            g.wait()
        }
        
        Log("rxswift concurrent queue", time / TIMES)
    }
}

