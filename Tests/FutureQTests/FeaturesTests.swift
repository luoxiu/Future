//
//  FeaturesTests.swift
//  FutureQ
//
//  Created by Quentin MED on 2019/6/3.
//

import Foundation
import XCTest
@testable import FutureQ

class FeaturesTests: XCTestCase {
    
    func testAlways() {
        var i = 0
        
        let p1 = Promise<Bool>()
        p1.future
            .always {
                i += 1
            }
            .hush()
        
        let p2 = Promise<Bool>()
        p2.future
            .always {
                i += 1
            }
            .hush()
        
        p1.succeed(true)
        p2.fail(TestError.e1)
        
        XCTAssertEqual(i, 2)
    }
    
    func testAnd() {
        var i = 0
        
        let p1 = Promise<Int>()
        let p2 = Promise<Int>()
        
        var r: (Int, Int)?
        p1.future.and(p2.future).whenSuccess {
            i += 1
            r = $0
        }
        
        p1.succeed(1)
        XCTAssertEqual(i, 0)
        
        p2.succeed(2)
        XCTAssertEqual(i, 1)
        
        XCTAssertEqual(r?.0, 1)
        XCTAssertEqual(r?.1, 2)
        
        var r1: (Int, Int)?
        p1.future.and(3).whenSuccess {
            r1 = $0
        }
        
        XCTAssertEqual(r1?.0, 1)
        XCTAssertEqual(r1?.1, 3)
    }
    
    func testAny() {
        let p1 = Promise<Int>()
        let p2 = Promise<Int>()
        let p3 = Promise<Int>()
        
        var i = 0
        Async.any(p1.future, p2.future, p3.future)
            .whenSuccess {
                i = $0
            }
        
        p2.succeed(2)
        
        XCTAssertEqual(i, 2)
    }
    
    func testAsAny() {
        let p = Promise<Int>()
        
        var i: Any?
        p.future.asAny().whenSuccess {
            i = $0
        }
        
        p.succeed(1)
        
        XCTAssertEqual((i as? Int), 1)
    }
    
    func testAsVoid() {
        let p = Promise<Int>()
        
        var i = 0
        p.future.asVoid().whenSuccess {
            i += 1
        }
        
        p.succeed(1)
        
        XCTAssertEqual(i, 1)
    }
    
    func testAwait() {
        let p = Promise<Int>()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
            p.succeed(1)
        }
        let i = try! p.future.await()
        XCTAssertEqual(i, 1)
    }
    
    func testCatch() {
        let p = Promise<Int>()
        
        var err: Error?
        p.future
            .catch {
                err = $0
            }
            .hush()
        
        p.fail(TestError.e1)
        
        XCTAssertTrue(err is TestError)
    }
    
    func testDelay() {
        let e = expectation(description: #function)
        
        let p = Promise<Int>()
        
        var exeDate: Date?
        p.future.delay(0.1, on: .main).whenSuccess { _ in
            exeDate = Date()
            XCTAssertTrue(Thread.isMainThread)
            e.fulfill()
        }
        
        let successDate = Date()
        p.succeed(1)
        
        waitForExpectations(timeout: 0.2, handler: nil)
        
        XCTAssertNotNil(exeDate)
        XCTAssertGreaterThan(exeDate!.timeIntervalSince(successDate), 0.1)
    }
    
    func testDone() {
        let p = Promise<Int>()
        
        var i = 0
        p.future.done {
            i = $0
        }.hush()
        
        p.succeed(1)
        
        XCTAssertEqual(i, 1)
    }
    
    func testFilter() {
        Future.success(1).filter { $0 % 2 == 0 }
            .whenComplete { (r) in
                XCTAssertNotNil(r.error)
            }
        
    }
}
