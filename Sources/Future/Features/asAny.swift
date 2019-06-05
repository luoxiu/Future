import Foundation

extension Thenable {
    
    @inlinable
    public func asAny() -> Future<Any, Failure> {
        return self.map { $0 }
    }
}
