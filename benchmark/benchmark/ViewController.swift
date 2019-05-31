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
        let promisekit = TestPromiseKit()
        let promises = TestPromises()
        let futureQ = TestFutureQ()
        
        dispatch.testSerialQueue()
        promisekit.testSerialQueue()
        promises.testSerialQueue()
        futureQ.testSerialQueue()
        
        dispatch.testDoubleSerialQueue()
        promisekit.testDoubleSerialQueue()
        promises.testDoubleSerialQueue()
        futureQ.testDoubleSerialQueue()
        
        dispatch.testTripleSerialQueue()
        promisekit.testTripleSerialQueue()
        promises.testTripleSerialQueue()
        futureQ.testTripleSerialQueue()
        
        dispatch.testConcurrentQueue()
        promisekit.testConcurrentQueue()
        promises.testConcurrentQueue()
        futureQ.testConcurrentQueue()
    }
}

