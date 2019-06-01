import XCTest
@testable import FutureQ

final class FutureQTests: XCTestCase {
    func testExample() {
        
        enum E: Error {
            case e
        }
        
        func makeAsyncTask<T>(_ t: T) -> Future<T> {
            return Future<T>.success(t)
        }
        
//        Future
//            .background {
//                makeAsyncTask(1)
//            }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
