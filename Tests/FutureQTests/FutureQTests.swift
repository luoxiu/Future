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
        
        let t = Async
            .background {
                makeAsyncTask(1)
            }
            .flat()
            .userInteractive { _ in
                makeAsyncTask("haha")
            }
            .flat()
            .tapValue {
                print($0)
            }
            .wait()
        
//        print(t)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
