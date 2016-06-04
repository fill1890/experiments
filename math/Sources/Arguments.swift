import Foundation

struct parseResult {
    let operation: String
    let switches: [String: Bool]
    let arg1: Int
    let arg2: Int
        
    init(operation: String, arg1: Int, arg2: Int, switches: [String: Bool]) {
        self.operation = operation
        self.arg1 = arg1
        self.arg2 = arg2
        self.switches = switches
    }
}

// Returns a parseResult object containing the parsed arguments
func parseArguments(_ args: [String], validOps: [String], validSwitches: [String]? = nil) throws -> parseResult {
    let shorts = ["v": "verbose", "h": "help"]
    
    guard args.count >= 4 else {
        throw ArgumentError.InvalidUsage
    }

    var switches: [String: Bool] = [:]

    for var arg in args {
        if arg.hasPrefix("--") {
            let curSwitch = String(arg.characters.dropFirst(2))
            if let allSwitches = validSwitches {
                if !allSwitches.contains(curSwitch) {
                    throw ArgumentError.InvalidSwitch
                }
            }
            switches[String(arg.characters.dropFirst(2))] = true
        } else if arg.hasPrefix("-") {
            let short = String(arg.characters.dropFirst(1))
            guard let switchName = shorts[short] else {
                throw ArgumentError.InvalidSwitch
            }
            switches[switchName] = true
        }
    }

    let mainArgs = args.filter() {
        (arg) in
        let notLong = !arg.hasPrefix("--")
        let notShort = !arg.hasPrefix("-")
        return notLong && notShort && arg.characters.count != 0
    }

    let arg1 = Int(mainArgs[2])
    let arg2 = Int(mainArgs[3])
    let op = mainArgs[1]

    guard arg1 != nil && arg2 != nil else {
        throw ArgumentError.InvalidValue  
    }

    guard validOps.contains(op) else {
        throw ArgumentError.InvalidOperation
    }

    return parseResult(operation: op, arg1: arg1!, arg2: arg2!, switches: switches)
}
