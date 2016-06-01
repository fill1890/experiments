### Package.swift:

Swift Package Manager file

### Sources/Arguments.swift

Argument parser

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

Math operations

### Program Flow

```
math <op> <a1> <a2>
```

1. Parse arguments
..* Set flags
..* Get operation
..* Get arguments
2. Apply operation
