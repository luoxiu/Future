import Foundation

extension Thenable {
    
    @inlinable
    public func timeout(_ seconds: Double, on queue: DispatchQueue, whenTimeout: @autoclosure @escaping () -> Failure) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        queue.asyncAfter(deadline: .now() + seconds) {
            p.fail(whenTimeout())
        }
        
        self.whenComplete { r in
            queue.async {
                switch r {
                case .success(let s):
                    p.succeed(s)
                case .failure(let e):
                    p.fail(e)
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public func timeout(_ seconds: Double, on scheduler: TimeoutScheduler, whenTimeout: @autoclosure @escaping () -> Failure) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        scheduler.schedule(after: seconds) {
            p.fail(whenTimeout())
        }
        
        self.whenComplete { r in
            scheduler.schedule {
                switch r {
                case .success(let s):
                    p.succeed(s)
                case .failure(let e):
                    p.fail(e)
                }
            }
        }
        
        return p.future
    }
}
