//
//  ViewController.swift
//  benchmark
//
//  Created by Quentin MED on 2019/5/31.
//  Copyright © 2019 Quentin MED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }
    
    func test() {
        let dispatch = TestDispatch()
        let futureQ = TestFutureQ()
        let promisekit = TestPromiseKit()
        let bright = TestBrightFutures()
        let hydra = TestHydra()
        let rx = TestRxSwift()
        let reactive = TestReactive()
        let promises = TestPromises()
        
        dispatch.testSerialQueue()
        futureQ.testSerialQueue()
        promisekit.testSerialQueue()
        bright.testSerialQueue()
        hydra.testSerialQueue()
        rx.testSerialQueue()
        reactive.testSerialQueue()
        promises.testSerialQueue()
        
        dispatch.testDoubleSerialQueue()
        futureQ.testDoubleSerialQueue()
        promisekit.testDoubleSerialQueue()
        bright.testDoubleSerialQueue()
        hydra.testDoubleSerialQueue()
        rx.testDoubleSerialQueue()
        reactive.testDoubleSerialQueue()
        promises.testDoubleSerialQueue()
        
        dispatch.testTripleSerialQueue()
        futureQ.testTripleSerialQueue()
        promisekit.testTripleSerialQueue()
        bright.testTripleSerialQueue()
        hydra.testTripleSerialQueue()
        rx.testTripleSerialQueue()
        reactive.testTripleSerialQueue()
        promises.testTripleSerialQueue()
        
        dispatch.testConcurrentQueue()
        futureQ.testConcurrentQueue()
        promisekit.testConcurrentQueue()
        bright.testConcurrentQueue()
        hydra.testConcurrentQueue()
        rx.testConcurrentQueue()
        reactive.testConcurrentQueue()
        promises.testConcurrentQueue()
    }
}

