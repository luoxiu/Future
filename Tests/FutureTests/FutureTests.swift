import XCTest
@testable import Future

class FutureTests: XCTestCase {

    func testPending() {
        let p = Promise<Bool, Error>()
        
        let f = p.future

        XCTAssertTrue(f.isPending)
        XCTAssertFalse(f.isCompleted)
        
        p.succeed(true)
        XCTAssertTrue(f.isCompleted)
        XCTAssertFalse(f.isPending)
        
        p.fail(TestError.e1)
        XCTAssertTrue(f.isCompleted)
        XCTAssertFalse(f.isPending)
    }
    
    func testInspect() {
        let p = Promise<Bool, Never>()
        let f = p.future
        
        XCTAssertNil(f.inspect())
        XCTAssertNil(f.inspectRoughly())
        
        p.succeed(true)
        XCTAssertNotNil(f.inspect())
        XCTAssertNotNil(f.inspectRoughly())
        
        XCTAssertEqual(f.inspect()?.value, true)
        
        let failedFuture = Future<Bool, TestError>.failure(TestError.e1)
        XCTAssertNotNil(failedFuture.inspect())
        XCTAssertTrue(failedFuture.inspect()!.error == TestError.e1)
    }
    
    func testComplete() {
        var count = 0
        let p1 = Promise<Bool, Never>()
        
        p1.future.whenSuccess { _ in
            count += 1
        }
        p1.succeed(true)
        
        XCTAssertEqual(count, 1)
        
        let p2 = Promise<Bool, Error>()
        p2.future.whenFailure { _ in
            count += 1
        }
        p2.fail(TestError.e1)
        
        XCTAssertEqual(count, 2)
    }
    
    func testMoreObservers() {
        var count = 0
        
        let p = Promise<Bool, Never>()
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
