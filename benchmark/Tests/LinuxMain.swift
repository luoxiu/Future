import XCTest

import benchmarkTests

var tests = [XCTestCaseEntry]()
tests += benchmarkTests.allTests()
XCTMain(tests)
