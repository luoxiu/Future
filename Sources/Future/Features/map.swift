import Foundation

extension Thenable {
    
    @inlinable
    public func map<U>(_ body: @escaping (Success) -> U) -> Future<U, Failure> {
        let p = Promise<U, Failure>()
        self.whenComplete { r in
            switch r {
            case .success(let s):
                p.succeed(body(s))
            case .failure(let e):
                p.fail(e)
            }
        }
        return p.future
    }
    
    @inlinable
    public func tryMap<U>(_ body: @escaping (Success) throws -> U) -> Future<U, Error> {
        let p = Promise<U, Error>()
        self.whenComplete { r in
            switch r {
            case .success(let s):
                do {
                    p.succeed(try body(s))
                } catch let e {
                    p.fail(e)
                }
            case .failure(let e):
                p.fail(e)
            }
        }
        return p.future
    }
    
    @inlinable
    public func mapError<E>(_ body: @escaping (Error) -> E) -> Future<Success, E> {
        let p = Promise<Success, E>()
        self.whenComplete { r in
            switch r {
            case .success(let s):
                p.succeed(s)
            case .failure(let e):
                p.fail(body(e))
            }
        }
        return p.future
    }
}
