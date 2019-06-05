import Foundation
import XCTest
@testable import Future

class FeaturesTests: XCTestCase {
    
    func testAlways() {
        var i = 0

        let p1 = PromiseE<Bool>()
        p1.future
            .always {
                i += 1
            }
            .hush()
        
        let p2 = PromiseE<Bool>()
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

        let p1 = PromiseE<Int>()
        let p2 = PromiseE<Int>()

        var r: (Int, Int)?
        p1.future.and(p2.future).whenSuccess {
            i += 1
            r = $0
        }

        p1.succeed(1)
        XCTAssertEqual(i, 0)
        XCTAssertNil(r)

        p2.succeed(2)
        XCTAssertEqual(i, 1)
        XCTAssertNotNil(r)

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
        let p = PromiseE<Int>()

        var i: Any?
        p.future.asAny().whenSuccess {
            i = $0
        }
        
        p.succeed(1)

        XCTAssertEqual((i as? Int), 1)
    }

    func testAsVoid() {
        let p = PromiseE<Int>()

        var i = 0
        p.future.asVoid().whenSuccess {
            i += 1
        }

        p.succeed(1)

        XCTAssertEqual(i, 1)
    }

    func testCatch() {
        let p = Promise<Int, TestError>()

        var e: TestError?
        p.future
            .catch {
                e = $0
            }
            .hush()

        p.fail(TestError.e1)

        XCTAssertNotNil(e)
        XCTAssertTrue(e! == TestError.e1)
    }

    func testDelay() {
        let e = expectation(description: "testDelay")

        let p = PromiseN<Int>()

        var ed: Date?
        p.future.delay(0.1, on: .main).whenSuccess { _ in
            ed = Date()
            XCTAssertTrue(Thread.isMainThread)
            e.fulfill()
        }

        let sd = Date()
        p.succeed(1)

        waitForExpectations(timeout: 0.2, handler: nil)

        XCTAssertNotNil(ed)
        XCTAssertGreaterThan(ed!.timeIntervalSince(sd), 0.1)
    }

    func testDone() {
        let p = PromiseN<Int>()
        
        var i: Int?
        p.future.done {
            i = $0
        }
        .mute()
        
        p.succeed(1)
        
        XCTAssertEqual(i, 1)
    }
    
    func testFlat() {
        let f = FutureN.success(1).map { FutureN.success($0) }.flat()
        XCTAssertEqual(f.inspectSuccess(), 1)
    }

    func testFlatMap() {
        let f1 = FutureN.success(1).flatMap { _ in FutureN.success(true) }
        XCTAssertEqual(f1.inspectSuccess(), true)

        enum E: Error {
            case e
        }
        
        let f2 = FutureE<Bool>.failure(E.e).flatMapError { _ in Future<Bool, TestError>.failure(TestError.e1) }
        XCTAssertNotNil(f2.inspectFailure())
        XCTAssertTrue(f2.inspectFailure()! == TestError.e1)
    }

    func testMap() {
        let f1 = FutureN.success(true).map { _ in 1 }
        XCTAssertEqual(f1.inspectSuccess(), 1)

        enum E: Error {
            case e
        }
        let f2 = FutureE<Bool>.failure(E.e).mapError { _ in TestError.e1 }
        XCTAssertNotNil(f2.inspectFailure())
        XCTAssertTrue(f2.inspectFailure()! == TestError.e1)
    }

    func testPipe() {
        let p1 = PromiseE<Int>()
        let p2 = PromiseE<Int>()

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
    
    func testRecover() {
        let f = FutureE<Int>.failure(TestError.e1).recover { _ in 1 }
        XCTAssertEqual(f.wait()!, 1)
    }

    func testReduce() {
        let futures = (1...9).map { FutureN.success($0) }

        let final = Async.reduce(futures, initial: 0) { (x, y) -> FutureN<Int> in
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

        let f = Async.retry(count: 3) { () -> FutureE<Int> in
            let p = PromiseE<Int>()

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
        let p1 = PromiseN<Int>()
        let p2 = PromiseN<Int>()
        let p3 = PromiseN<Int>()

        Async.some([p1.future, p2.future, p3.future], count: 2).whenSuccess { (rs) in
            XCTAssertEqual(rs, [1, 3])
        }

        p1.succeed(1)
        p3.succeed(3)
        p2.succeed(2)
    }

    func testTap() {
        FutureE.success(1).tap {
            XCTAssertEqual($0, 1)
        }.mute()

        Future<Bool, TestError>.failure(TestError.e1).tapError {
            XCTAssertTrue($0 == TestError.e1)
        }.mute()
    }

    func testTimeout() {
        let p = Promise<Int, TestError>()
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            p.succeed(1)
        }
        let timeout = p.future.timeout(0.1, on: .main)
        
        let e = expectation(description: "testTimeout")
        timeout.whenComplete { _ in
            print("whenComplete")
            e.fulfill()
        }
        
        waitForExpectations(timeout: 0.2, handler: nil)
        XCTAssertNotNil(timeout.inspectFailure())
        XCTAssertTrue(timeout.inspectFailure()!.isTimeout)
    }
    
    func testValidate() {
        let e = Future<Int, TestError>.success(1)
            .validate {
                $0 % 2 == 0
            }
            .waitError()
        
        XCTAssertNotNil(e)
        XCTAssertTrue(e!.isValidate)
    }


    func testWhenAll() {
        let p1 = PromiseN<Int>()
        let p2 = PromiseN<Int>()
        let p3 = PromiseN<Int>()

        var i = 0
        p1.future.whenComplete { _ in i += 1 }
        p2.future.whenComplete { _ in i += 1 }
        p3.future.whenComplete { _ in i += 1 }

        Async.whenAllCompleteVoid([p1.future, p2.future, p3.future]).whenSuccess { _ in
            i += 1
        }

        Async.whenAllSucceed([p1.future, p2.future, p3.future]).whenSuccess { r in
            i += 1
            XCTAssertEqual(r, [1, 2, 3])
        }

        p1.succeed(1)
        p2.succeed(2)
        p3.succeed(3)

        XCTAssertEqual(i, 5)
    }

    func testWhenAny() {
        let p1 = PromiseE<Int>()
        let p2 = PromiseE<Int>()
        let p3 = PromiseE<Int>()

        var i = 0
        Async.whenAnyComplete(p1.future, p2.future, p3.future)
            .whenSuccess {
                i = $0
            }

        p2.succeed(2)

        XCTAssertEqual(i, 2)
    }

    func testYield() {
        let p1 = PromiseN<Int>()
        let q1 = DispatchQueue(label: UUID().uuidString)
        let e1 = expectation(description: "testYieldDispatchQueue")
        p1.future.yield(on: q1).whenSuccess { _ in
            XCTAssertTrue(DispatchQueue.isOn(q1))
            e1.fulfill()
        }

        DispatchQueue.global().async {
            p1.succeed(1)
        }

        waitForExpectations(timeout: 0.5, handler: nil)
    }
}
