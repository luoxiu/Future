import Foundation

extension Thenable {
    
    @inlinable
    public func validate(_ body: @escaping (Success) -> Bool, whenFail: @autoclosure @escaping () -> Failure) -> Future<Success, Failure> {

        let p = Promise<Success, Failure>()
        
        self.whenComplete { r in
            switch r {
            case .success(let s):
                if body(s) {
                    p.succeed(s)
                } else {
                    p.fail(whenFail())
                }
            case .failure(let e):
                p.fail(e)
            }
        }
        
        return p.future
    }
}
