import Foundation

extension Thenable {
    
    public func and<U: Thenable>(_ thenable: U) -> Future<(Success, U.Success), Failure> where U.Failure == Failure {
        return Async.whenAllSucceed(self, thenable)
    }
    
    public func and<U>(_ u: U) -> Future<(Success, U), Failure> {
        return self.map { ($0, u) }
    }
}
