import Foundation

public enum FutureError<Failure: Error>: Error {

    case timeout
    
    case validate
    
    case map(Error)
    
    case relay(Failure)
}

extension FutureError {
    
    public var isTimeout: Bool {
        switch self {
        case .timeout:  return true
        default:        return false
        }
    }
    
    public var isValidate: Bool {
        switch self {
        case .validate: return true
        default:        return false
        }
    }
}
