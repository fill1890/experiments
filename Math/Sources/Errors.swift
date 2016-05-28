enum ArgumentError: ErrorProtocol {
    case InvalidSwitch
    case InvalidOperation
    case InvalidValue
    case InvalidUsage
}

extension ArgumentError: CustomStringConvertible {
    var description: String {
        switch self {
            case .InvalidSwitch:
                return "Invalid switch"
            case .InvalidOperation:
                return "Invalid operation"
            case .InvalidValue:
                return "Invalid value"
            case .InvalidUsage:
                return "Invalid usage"
        }  
    }
}
