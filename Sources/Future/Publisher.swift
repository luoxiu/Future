#if canImport(Combine)
import Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Future {
    
    public func asPublisher() -> Combine.Future<Success, Failure> {
        return .init(self.whenComplete)
    }
}

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
extension Publisher {
    
    public func asFuture(whenNoOutput: @autoclosure @escaping () -> Failure) -> Future<Output, Failure> {
        let p = Promise<Output, Failure>()
        
        var cancel: Cancellable? = self.sink(receiveCompletion: { (c) in
            switch c {
            case .failure(let e):   p.fail(e)
            case .finished:         p.fail(whenNoOutput())
            }
        }, receiveValue: { v in
            p.succeed(v)
        })
        
        let future = p.future
        
        future.whenComplete { _ in
            cancel?.cancel()
            cancel = nil
        }
        
        return future
    }
}

#endif
