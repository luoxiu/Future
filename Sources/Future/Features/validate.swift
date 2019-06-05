import Foundation

extension Thenable {
    
    @inlinable
    public func validate(_ body: @escaping (Success) -> Bool) -> Future<Success, FutureError<Failure>> {

        let p = Promise<Success, FutureError<Failure>>()
        
        self.whenComplete { r in
            switch r {
            case .success(let s):
                if body(s) {
                    p.succeed(s)
                } else {
                    p.fail(.validate)
                }
            case .failure(let e):
                p.fail(.relay(e))
            }
        }
        
        return p.future
    }
}
