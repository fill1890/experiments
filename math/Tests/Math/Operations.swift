import XCTest
@testable import Math

class OperationsTests: XCTestCase {
    func testAdd() {
        XCTAssertEqual(
            operations["add"]!(1, 2),
            3,
            "1 + 2 != 3"
        )
    }
    func testSub() {
        XCTAssertEqual(
            operations["sub"]!(1, 2),
            -1,
            "1 - 2 != -1"
        )
    }
}

#if os(Linux)
extension OperationsTests {
    static var allTests: [(String, (OperationsTests) -> () throws -> Void)] {
        return [
            ("testAdd", testAdd),
            ("testSub", testSub)
        ]
    }
}
#endif
