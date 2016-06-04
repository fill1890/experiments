// TODO: Throw XCTest errors in invalids instead of printing errors

import XCTest
@testable import Math

class ArgumentsTests: XCTestCase {

    let standardTestContents: [String] = [
        "./Math",
        "--help",
        "add",
        "1",
        "2",
        "-v"
    ]

    let operationStubs: [String] = ["add", "sub"]

    func testSwitchParse() { 
        let parseResult = try! parseArguments(standardTestContents, validOps: operationStubs)
    
        XCTAssertEqual(
            parseResult.switches,
            ["verbose": true, "help": true],
            "Switches not parsed correctly"
        )
    }
    func testOpParse() {
        let parseResult = try! parseArguments(standardTestContents, validOps: operationStubs)
        
        XCTAssertEqual(
            parseResult.operation, 
            "add", 
            "Operation 'add' not parsed correctly"
        )
    }
    func testArgParse() {
        let parseResult = try! parseArguments(standardTestContents, validOps: operationStubs)
        
        XCTAssertEqual(
            parseResult.arg1, 
            1, 
            "Argument 1 not parsed correctly"
        )
        XCTAssertEqual(
            parseResult.arg2, 
            2, 
            "Argument 2 not parsed correctly"
         )
    }
    func testInvalidArg() {
        do {
            try _ = parseArguments(["./Math", "add", "one", "two"], validOps: operationStubs)
        print("ERROR: Invalid argument error not thrown")
        } catch let error as ArgumentError {
            XCTAssertEqual(
                error.description,
                ArgumentError.InvalidValue.description,
                "Invalid value error not thrown"
            )
        } catch {
            // Somehow, the thrown error isn't an ArgumentError. HELP
            print("OH NO")
        }
    }
    func testInvalidOp() {
        do {
            try _ = parseArguments(["./Math", "ohno", "1", "2"], validOps: operationStubs)
            print("ERROR: Invalid operation error not thrown")
        } catch let error as ArgumentError {
            XCTAssertEqual(
                error.description,
                ArgumentError.InvalidOperation.description,
                "Invalid value error not thrown"
            )
        } catch {
            // Somehow, the thrown error isn't an ArgumentError. HELP
            print("OH NO")
        }
    }
    func testInvalidSwitch() {
        do {
            try _ = parseArguments(["./Math", "add", "1", "2", "--ohno"], validOps: operationStubs, validSwitches: ["verbose", "help"])
            print("ERROR: Invalid switch error not thrown")
        } catch let error as ArgumentError {
            XCTAssertEqual(
                error.description,
                ArgumentError.InvalidSwitch.description,
                "Invalid switch error not thrown"
            )
        } catch {
            // Somehow, the thrown error isn't an ArgumentError. HELP
            print("OH NO")
        }
    }
}

#if os(Linux)
extension ArgumentsTests {
    static var allTests: [(String, (ArgumentsTests) -> () throws -> Void)] {
        return [
            ("testOpParse", testOpParse),
            ("testArgParse", testArgParse),
            ("testSwitchParse", testSwitchParse),
            ("testInvalidArg", testInvalidArg),
            ("testInvalidOp", testInvalidOp),
            ("testInvalidSwitch", testInvalidSwitch)
        ]
    }
}
#endif
