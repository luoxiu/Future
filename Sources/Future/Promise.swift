import Foundation

/// A promise is responsible for managing the state of a future.
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
