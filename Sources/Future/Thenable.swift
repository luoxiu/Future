import Foundation

public protocol Thenable {
    
    associatedtype Success
    associatedtype Failure where Failure: Error
    
    func whenComplete(_ body: @escaping (Result<Success, Failure>) -> Void)
    
    func inspect() -> Result<Success, Failure>?
    
    func inspectWithoutLock() -> Result<Success, Failure>?
}

extension Thenable {
    
    @discardableResult
    @inlinable
    public func whenSucceed(_ body: @escaping (Success) -> Void) -> Self {
        self.whenComplete { r in
            if case .success(let t) = r {
                body(t)
            }
        }
        return self
    }
    
    @discardableResult
    @inlinable
    public func whenFail(_ body: @escaping (Failure) -> Void) -> Self {
        self.whenComplete { r in
            if case .failure(let e) = r {
                body(e)
            }
        }
        return self
    }
    
    @inlinable
    public func inspectSuccess() -> Success? {
        return self.inspect()?.value
    }
    
    @inlinable
    public func inspectFailure() -> Failure? {
        return self.inspect()?.error
    }
}

extension Thenable {
    
    @inlinable
    public func toFuture() -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        self.pipe(to: p)
        return p.future
    }
}
