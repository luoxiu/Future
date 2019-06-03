//
//  FutureTests.swift
//  FutureQTests
//
//  Created by Quentin MED on 2019/6/3.
//

import XCTest
@testable import FutureQ

class FutureTests: XCTestCase {

    func testPending() {
        let pendingFuture = Promise<Bool>().future
        
        XCTAssertTrue(pendingFuture.isPending)
        XCTAssertFalse(pendingFuture.isCompleted)
        
        let completedFuture = Future<Bool>.success(true)
        XCTAssertTrue(completedFuture.isCompleted)
        XCTAssertFalse(completedFuture.isPending)
    }
    
    func testInspect() {
        let pendingFuture = Promise<Bool>().future
        XCTAssertNil(pendingFuture.inspect())
        XCTAssertNil(pendingFuture.inspectWildly())
        
        let completedFuture = Future<Bool>.success(true)
        XCTAssertNotNil(completedFuture.inspect())
        XCTAssertNotNil(completedFuture.inspectWildly())
        
        XCTAssertEqual(completedFuture.inspect()?.value, true)
        
        let failedFuture = Future<Bool>.failure(TestError.e1)
        XCTAssertTrue(failedFuture.inspect()?.error is TestError)
    }
    
    func testComplete() {
        var count = 0
        let p1 = Promise<Bool>()
        
        p1.future.whenSuccess { _ in
            count += 1
        }
        p1.succeed(true)
        
        XCTAssertEqual(count, 1)
        
        let p2 = Promise<Bool>()
        
        p2.future.whenFailure { _ in
            count += 1
        }
        p2.fail(TestError.e1)
        
        XCTAssertEqual(count, 2)
    }
    
    func testMultiObservers() {
        var count = 0
        
        let p = Promise<Bool>()
        p.future.whenSuccess { _ in
            count += 1
        }
        p.future.whenSuccess { _ in
            count += 1
        }
        p.future.whenSuccess { _ in
            count += 1
        }
        
        p.succeed(true)
        
        XCTAssertEqual(count, 3)
    }
}
