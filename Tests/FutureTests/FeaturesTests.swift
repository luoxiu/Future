import Foundation
import XCTest
@testable import Future

class FeaturesTests: XCTestCase {
    
    func testAlways() {
        var i = 0

        let p1 = Promise<Bool, Never>()
        p1.future
            .always {
                i += 1
            }
            .hush()
        
        let p2 = Promise<Bool, Error>()
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

        let p1 = Promise<Int, Error>()
        let p2 = Promise<Int, Error>()

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
        let p = Promise<Int, Error>()

        var i: Any?
        p.future.asAny().whenSuccess {
            i = $0
        }
        
        p.succeed(1)

        XCTAssertEqual((i as? Int), 1)
    }

    func testAsVoid() {
        let p = Promise<Int, Error>()

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

        let p = Promise<Int, Never>()

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
        let p = Promise<Int, Never>()
        
        var i: Int?
        p.future.done {
            i = $0
        }
        .mute()
        
        p.succeed(1)
        
        XCTAssertEqual(i, 1)
    }
    
    func testFlat() {
        let f = Future<Int, Never>.success(1).map { Future<Int, Never>.success($0) }.flat()
        XCTAssertEqual(f.inspectSuccess(), 1)
    }

    func testFlatMap() {
        let f1 = Future<Int, Never>.success(1).flatMap { _ in Future<Bool, Never>.success(true) }
        XCTAssertEqual(f1.inspectSuccess(), true)

        enum E: Error {
            case e
        }
        
        let f2 = Future<Bool, Error>.failure(E.e).flatMapError { _ in Future<Bool, TestError>.failure(TestError.e1) }
        XCTAssertNotNil(f2.inspectFailure())
        XCTAssertTrue(f2.inspectFailure()! == TestError.e1)
    }

    func testMap() {
        let f1 = Future<Bool, Never>.success(true).map { _ in 1 }
        XCTAssertEqual(f1.inspectSuccess(), 1)

        enum E: Error {
            case e
        }
        let f2 = Future<Bool, Error>.failure(E.e).mapError { _ in TestError.e1 }
        XCTAssertNotNil(f2.inspectFailure())
        XCTAssertTrue(f2.inspectFailure()! == TestError.e1)
    }

    func testPipe() {
        let p1 = Promise<Int, Error>()
        let p2 = Promise<Int, Error>()

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
        let f = Future<Int, Error>.failure(TestError.e1).recover { _ in 1 }
        XCTAssertEqual(f.wait()!, 1)
    }

    func testReduce() {
        let futures = (1...9).map { Future<Int, Never>.success($0) }

        let final = Async.reduce(futures, initial: 0) { (x, y) -> Future<Int, Never> in
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

        let f = Async.retry(count: 3) { () -> Future<Int, Error> in
            let p = Promise<Int, Error>()

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
        let p1 = Promise<Int, Never>()
        let p2 = Promise<Int, Never>()
        let p3 = Promise<Int, Never>()

        Async.some([p1.future, p2.future, p3.future], count: 2).whenSuccess { (rs) in
            XCTAssertEqual(rs, [1, 3])
        }

        p1.succeed(1)
        p3.succeed(3)
        p2.succeed(2)
    }

    func testTap() {
        Future<Int, Error>.success(1).tap {
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
        let timeout = p.future.timeout(0.1, on: .main, whenTimeout: .e1)
        
        let e = expectation(description: "testTimeout")
        timeout.whenComplete { _ in
            print("whenComplete")
            e.fulfill()
        }
        
        waitForExpectations(timeout: 0.2, handler: nil)
        XCTAssertNotNil(timeout.inspectFailure())
        XCTAssertTrue(timeout.inspectFailure()! == .e1)
    }
    
    func testValidate() {
        let e = Future<Int, TestError>.success(1)
            .validate({ $0 % 2 == 0 }, whenFail: .e1)
            .waitError()
        
        XCTAssertNotNil(e)
        XCTAssertTrue(e! == .e1)
    }


    func testWhenAll() {
        let p1 = Promise<Int, Never>()
        let p2 = Promise<Int, Never>()
        let p3 = Promise<Int, Never>()

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
        let p1 = Promise<Int, Error>()
        let p2 = Promise<Int, Error>()
        let p3 = Promise<Int, Error>()

        var i = 0
        Async.whenAnyComplete(p1.future, p2.future, p3.future)
            .whenSuccess {
                i = $0
            }

        p2.succeed(2)

        XCTAssertEqual(i, 2)
    }

    func testYield() {
        let p1 = Promise<Int, Never>()
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
