import Foundation

extension Thenable {
    
    @inlinable
    public func flatMap<U>(_ body: @escaping (Success) -> Future<U, Failure>) -> Future<U, Failure> {
        let p = Promise<U, Failure>()
        self.whenComplete { r in
            switch r {
            case .success(let s):
                body(s).pipe(to: p)
            case .failure(let e):
                p.fail(e)
            }
        }
        return p.future
    }
    
    @inlinable
    public func flatMapError<E>(_ body: @escaping (Failure) -> Future<Success, E>) -> Future<Success, E> {
        let p = Promise<Success, E>()
        self.whenComplete { r in
            switch r {
            case .success(let s):
                p.succeed(s)
            case .failure(let e):
                body(e).pipe(to: p)
            }
        }
        return p.future
    }
}
