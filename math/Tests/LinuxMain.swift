import XCTest
@testable import MathTestSuite

XCTMain([
    testCase(ArgumentsTests.allTests),
    testCase(OperationsTests.allTests)
])
