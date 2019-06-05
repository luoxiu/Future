import Foundation
import XCTest
@testable import Future

class AsyncTests: XCTestCase {
    
    func testAsync() {
        
        func task() throws -> Int {
            return 1
        }
        
        let e = expectation(description: "testAsync")
        
        Async
            .background {
                try task()
            }
            .main {
                XCTAssertEqual($0, 1)
                e.fulfill()
            }
            .mute()
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
}
