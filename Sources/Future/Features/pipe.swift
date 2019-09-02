import Foundation

extension Thenable {
    
    @inlinable
    public func pipe(to promise: Promise<Success, Failure>) {
        self.whenComplete(promise.complete)
    }
    
    @inlinable
    public func pipeSuccess(to promise: Promise<Success, Failure>) {
        self.whenSucceed(promise.succeed)
    }
    
    @inlinable
    public func pipeFailure(to promise: Promise<Success, Failure>) {
        self.whenFail(promise.fail)
    }
}
