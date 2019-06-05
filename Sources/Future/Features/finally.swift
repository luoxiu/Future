import Foundation

extension Thenable {
    
    // Alias for `always`
    @inlinable
    public func finally(_ body: @escaping () -> Void) -> Future<Success, Failure> {
        return self.always(body)
    }
}
