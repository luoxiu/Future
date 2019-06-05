import Foundation

extension Thenable {
    
    @inlinable
    public func delay(_ seconds: Double, on queue: DispatchQueue) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        self.whenComplete { r in
            queue.asyncAfter(deadline: .now() + seconds) {
                p.complete(r)
            }
        }
        return p.future
    }
    
    @inlinable
    public func delay(_ seconds: Double, on scheduler: TimeoutScheduler) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        self.whenComplete { r in
            scheduler.schedule(after: seconds) {
                p.complete(r)
            }
        }
        return p.future
    }
}
