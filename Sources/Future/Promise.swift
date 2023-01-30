import Foundation

/// A promise to provide a result later.
public struct Promise<Success, Failure> where Failure: Error {
    
    public let future: Future<Success, Failure>
    
    @inlinable
    public init() {
        self.future = Future<Success, Failure>()
    }
    
    @inlinable
    public func succeed(_ success: Success) {
        self.future.complete(.success(success))
    }
    
    @inlinable
    public func fail(_ failure: Failure) {
        self.future.complete(.failure(failure))
    }
}

extension Promise {

    @inlinable
    public func complete(_ result: Result<Success, Failure>) {
        self.future.complete(result)
    }
}
