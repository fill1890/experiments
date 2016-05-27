import Foundation

let helpText = "yo"

var verbose = false

let shorts: [String: String] = [
    "v": "verbose",
    "h": "help"
]

let funcs: [String: (Int, Int) -> Int] = [
    "add": {
        (a, b) in
        return a + b
    },
    "sub": {
        (a, b) in
        return a - b
    }
]

let args = Process.arguments

func parseArgs(rawArg: String) {
    var arg: String? = rawArg
    
    if arg.characters.count == 1 {
        arg = shorts[rawArg]

        guard arg != nil else {
            print("Warning: Illegal argument '\(arg)'")
            exit(1)
        }
    }

    switch arg {
        case "help":
            print(helpText)
        case "verbose":
            verbose = true
        default:
            print("Warning: Illegal argument '\(arg)'")
            exit(1)
    }
}

guard args.count >= 4 else {
    print("Usage: math <operator> <num1> <num2>")
    exit(1)
}

guard let op = funcs[args[1]] else {
    print("'\(args[1])' is not a valid operator")
    exit(1)
}

guard let a = Int(args[2]) else {
    print("'\(args[2])' is not an integer")
    exit(1)
}

guard let b = Int(args[3]) else {
    print("'\(args[3])' is not an integer")
    exit(1)
}

print("op: \(op), a: \(a), b: \(b)")

print(op(a, b))

exit(0)
