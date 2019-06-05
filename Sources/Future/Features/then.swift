import Foundation

extension Thenable {
    
    // Alias for whenComplete
    @inlinable
    public func then(_ callback: @escaping (Result<Success, Failure>) -> Void) {
        self.whenComplete(callback)
    }
    
    // Alias for flatMap
    @inlinable
    public func then<U>(_ body: @escaping (Success) -> Future<U, Failure>) -> Future<U, Failure> {
        return self.flatMap(body)
    }
    
    // Alias for map
    @inlinable
    public func thenReturn<U>(_ body: @escaping (Success) -> U) -> Future<U, Failure> {
        return self.map(body)
    }
}
