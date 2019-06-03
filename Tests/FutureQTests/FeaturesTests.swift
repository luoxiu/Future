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
    
    func testFilter() {
        let e = Future.success(1)
            .filter { $0 % 2 == 0 }
            .waitError()
        
        XCTAssertNotNil(e)
        XCTAssertTrue(e is TestError)
    }
    
    func testFlat() {
        let f = Future.success(1).mapValue { Future.success($0) }.flat()
        XCTAssertEqual(f.inspectValue(), 1)
    }
    
    func testFlatMap() {
        let f1 = Future.success(1).flatMapValue { _ in Future.success(true) }
        XCTAssertEqual(f1.inspectValue(), true)
        
        let f2 = Future<Bool>.failure(TestError.e1).flatMapError { _ in Future.success(false) }
        XCTAssertEqual(f2.inspectValue(), false)
    }
    
    func testMap() {
        let f1 = Future.success(true).mapValue { _ in 1 }
        XCTAssertEqual(f1.inspectValue(), 1)
        
        let f2 = Future<Bool>.failure(TestError.e1).mapError { _ in true }
        XCTAssertEqual(f2.inspectValue(), true)
    }
    
    func testPipe() {
        let p1 = Promise<Int>()
        let p2 = Promise<Int>()
        
        var i = 0
        p1.future.whenSuccess {
            i = $0
        }
        p2.future.whenFailure { _ in
            i += 1
        }
        
        Future.success(1).pipeSuccess(to: p1)
        XCTAssertEqual(i, 1)
        
        Future.failure(TestError.e1).pipeFailure(to: p2)
        XCTAssertEqual(i, 2)
    }
    
    func testReduce() {
        let futures = (1...9).map { Future.success($0) }
        
        let final = Async.reduce(futures, initial: 0) { (x, y) -> Future<Int> in
            Future.success(x + y)
        }
        
        var i = 0
        final.whenSuccess {
            i = $0
        }
        XCTAssertEqual(i, 45)
    }
    
    func testRetry() {
        var count = 3
        
        let f = Async.retry(count: 3) { () -> Future<Int> in
            let p = Promise<Int>()
            
            if count > 0 {
                p.fail(TestError.e1)
                count -= 1
            } else {
                p.succeed(1)
            }
            
            return p.future
        }
        
        var i = 0
        f.whenSuccess {
            i = $0
        }
        
        XCTAssertEqual(i, 1)
    }
    
    func testSome() {
        let p1 = Promise<Int>()
        let p2 = Promise<Int>()
        let p3 = Promise<Int>()
        
        Async.some([p1.future, p2.future, p3.future], count: 2).whenSuccess { (rs) in
            XCTAssertEqual(rs, [1, 3])
        }
        
        p1.succeed(1)
        p3.succeed(3)
        p2.succeed(2)
    }
    
    func testTap() {
        Future.success(1).tapValue {
            XCTAssertEqual($0, 1)
        }.mute()
        
        Future<Bool>.failure(TestError.e1).tapError {
            XCTAssertTrue($0 is TestError)
        }.mute()
    }
    
    func testTimeout() {
        let p = Promise<Int>()
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            p.succeed(1)
        }
        XCTAssertNotNil(p.future.timeout(0.1, on: .main).wait().error)
    }
    
    
    
    func testWhenAnyComplete() {
        let p1 = Promise<Int>()
        let p2 = Promise<Int>()
        let p3 = Promise<Int>()
        
        var i = 0
        Async.whenAnyComplete(p1.future, p2.future, p3.future)
            .whenSuccess {
                i = $0
        }
        
        p2.succeed(2)
        
        XCTAssertEqual(i, 2)
    }
    
    func testYield() {
        let p1 = Promise<Int>()
        let q1 = DispatchQueue(label: UUID().uuidString)
        let e1 = expectation(description: "testYieldDispatchQueue")
        p1.future.yield(on: q1).whenSuccess { _ in
            XCTAssertTrue(DispatchQueue.isOn(q1))
            e1.fulfill()
        }
        
        let p2 = Promise<Int>()
        let q2 = OperationQueue()
        q2.name = "q2"
        let e2 = expectation(description: "testYieldOperationQueue")
        p2.future.yield(on: q2).whenSuccess { _ in
            XCTAssertEqual(OperationQueue.current?.name, "q2")
            e2.fulfill()
        }
        
        DispatchQueue.global().async {
            p1.succeed(1)
            p2.succeed(1)
        }
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
}
