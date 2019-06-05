import Foundation

extension Thenable {
    
    @inlinable
    public func asVoid() -> Future<Void, Failure> {
        return self.map { _ in () }
    }
}
