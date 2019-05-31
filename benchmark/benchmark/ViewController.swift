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
        let promises = TestPromises()
        let promisekit = TestPromiseKit()
        
        dispatch.testSerialQueue()
        futureQ.testSerialQueue()
        promises.testSerialQueue()
        promisekit.testSerialQueue()
        
        dispatch.testDoubleSerialQueue()
        futureQ.testDoubleSerialQueue()
        promises.testDoubleSerialQueue()
        promisekit.testDoubleSerialQueue()
        
        dispatch.testTripleSerialQueue()
        futureQ.testTripleSerialQueue()
        promises.testTripleSerialQueue()
        promisekit.testTripleSerialQueue()
        
        dispatch.testConcurrentQueue()
        futureQ.testConcurrentQueue()
        promises.testConcurrentQueue()
        promisekit.testConcurrentQueue()
    }
}

