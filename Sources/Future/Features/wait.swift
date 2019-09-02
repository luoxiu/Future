import Foundation

extension Thenable {
    
    @inlinable
    public func wait() -> Success? {
        let sema = DispatchSemaphore(value: 0)
        self.whenComplete { _ in
            sema.signal()
        }
        sema.wait()
        
        return self.inspectWithoutLock()!.value
    }
    
    @inlinable
    public func waitError() -> Failure? {
        let sema = DispatchSemaphore(value: 0)
        self.whenComplete { _ in
            sema.signal()
        }
        sema.wait()
        
        return self.inspectWithoutLock()!.error
    }
}
