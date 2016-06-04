Math module, written in Swift and utilizing Swift Package Manager.

Note: Running 'swift build' in this directory currently builds a library,
not an executable. To build an executable as described in ../README.md, 
change to the parent directory and run `make math` or just `make` (To
build all projects).

### Package.swift:

Swift Package Manager file

### Sources/Arguments.swift

Argument parser

- parseArguments:args:validOps:validSwitches:
Returns a `parseResult` object containing the parsed arguments.
Throws an ArgumentError if any arguments are invalid.
| Argument        | Info                      |
| ---------------:|:------------------------- |
| `args`          | Array of arguments        |
| `validOps`      | Array of valid operations |
| `validSwitches` | Array of valid switches   |

+ parseResult
Struct for storing results of an argument parse
| Property      | Info                     |
| -------------:|:------------------------ |
| `operation`   | Operation requested      |
| `switches`    | Dict of booleans         |
| `arg1` `arg2` | Integer arguments passed | 

### Sources/Data.swift

Static data:

```swift
helpText: String
```
Help text for `--help` argument

### Sources/Errors.swift

App-specific errors:
```swift
ArgumentError.InvalidSwitch
ArgumentError.InvalidOperation
ArgumentError.InvalidValue
```

### Sources/Main.swift

Entry point and primary file

### Sources/Operations.swift

Math operations:
```swift
operations {
    add(Int, Int) -> Int
    sub(Int. Int) -> Int
}
```

### Program Flow

```
math <op> <a1> <a2>
```

1. Parse arguments
..* Set flags
..* Get operation
..* Get arguments
2. Apply operation
