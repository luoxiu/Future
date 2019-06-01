import Foundation

extension NSLocking {
    
    @inlinable
    func withLock<T>(_ closure: () throws -> T) rethrows -> T {
        self.lock()
        defer { self.unlock() }
        return try closure()
    }
    
    @inlinable
    func withLockVoid(_ closure: () throws -> Void) rethrows {
        self.lock()
        defer { self.unlock() }
        try closure()
    }
}

extension DispatchQueue {
    
    @inlinable
    static func isRunningOn(_ queue: DispatchQueue) -> Bool {
        let key = DispatchSpecificKey<Void>()
        queue.setSpecific(key: key, value: ())
        defer {
            queue.setSpecific(key: key, value: nil)
        }
        return DispatchQueue.getSpecific(key: key) != nil
    }
}

extension Result {
    
    @inlinable
    var value: Success? {
        switch self {
        case .success(let v):   return v
        default:                return nil
        }
    }
    
    @inlinable
    var error: Failure? {
        switch self {
        case .failure(let e):   return e
        default:                return nil
        }
    }
}
