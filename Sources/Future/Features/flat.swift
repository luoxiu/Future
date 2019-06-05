import Foundation

extension Thenable where Success: Thenable, Success.Failure == Failure {
    
    public func flat() -> Future<Success.Success, Failure> {
        return self.flatMap { $0.toFuture() }
    }
}
