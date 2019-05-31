import XCTest
@testable import FutureQ

final class FutureQTests: XCTestCase {
    func testExample() {
        
        let q1 = DispatchQueue(label: UUID().uuidString)
        let q2 = DispatchQueue(label: UUID().uuidString)
        
        let promise = Promise<Bool>()
        let future = promise.future
        
        let g = DispatchGroup()
        
        q1.async {
            promise.succeed(true)
        }
        
        g.enter()
        future.whenSuccess { _ in
            XCTAssert(DispatchQueue.isRunningOn(q1))
            g.leave()
        }
        
        g.enter()
        future.yield(on: q2).whenSuccess { _ in
            XCTAssert(DispatchQueue.isRunningOn(q2))
            g.leave()
        }
        
        g.wait()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
