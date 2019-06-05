import Foundation

extension Thenable {
    
    @inlinable
    public func timeout(_ seconds: Double, on queue: DispatchQueue) -> Future<Success, FutureError<Failure>> {
        let p = Promise<Success, FutureError<Failure>>()
        queue.asyncAfter(deadline: .now() + seconds) {
            p.fail(.timeout)
        }
        
        self.whenComplete { r in
            queue.async {
                switch r {
                case .success(let s):
                    p.succeed(s)
                case .failure(let e):
                    p.fail(.relay(e))
                }
            }
        }
        
        return p.future
    }
    
    @inlinable
    public func timeout(_ seconds: Double, on scheduler: TimeoutScheduler) -> Future<Success, FutureError<Failure>> {
        let p = Promise<Success, FutureError<Failure>>()
        scheduler.schedule(after: seconds) {
            p.fail(.timeout)
        }
        
        self.whenComplete { r in
            scheduler.schedule {
                switch r {
                case .success(let s):
                    p.succeed(s)
                case .failure(let e):
                    p.fail(.relay(e))
                }
            }
        }
        
        return p.future
    }
}
