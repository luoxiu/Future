import RxSwift

let tests: [Test] = [
    TestDispatch(),
    TestFuture(),
    TestPromises(),
    TestPromiseKit(),
    TestBrightFutures(),
    TestHydra(),
    TestRxSwift(),
    TestReactive()
]

func testSerial() {
    
    for test in tests {
        test.testSerialQueue()
        test.testDoubleSerialQueue()
        test.testTripleSerialQueue()
    }
}

func testConcurrent() {
    
    for test in tests {
        test.testConcurrentQueue()
    }
}

testSerial()
testConcurrent()

