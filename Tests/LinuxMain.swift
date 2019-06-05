import XCTest

import FutureTests

var tests = [XCTestCaseEntry]()
tests += FutureTests.allTests()
XCTMain(tests)
