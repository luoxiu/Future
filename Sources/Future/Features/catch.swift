import Foundation

extension Thenable {
    
    @inlinable
    public func `catch`(_ body: @escaping (Failure) -> Void) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        self.whenComplete { r in
            switch r {
            case .success(let s):
                p.succeed(s)
            case .failure(let e):
                body(e)
                p.fail(e)
            }
        }
        return p.future
    }
}
