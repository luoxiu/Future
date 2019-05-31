import Foundation

final class Atomic<T> {
    
    @usableFromInline
    var _val: T
    
    @usableFromInline
    let _lock = Lock()
    
    @inlinable
    init(_ value: T) {
        self._val = value
    }
    
    @inlinable
    func read<U>(_ body: (T) -> U) -> U {
        return self._lock.withLock { body(self._val) }
    }
    
    @inlinable
    func readVoid(_ body: (T) -> Void) {
        return self._lock.withLockVoid { body(self._val) }
    }
    
    @inlinable
    func write<U>(_ body: (inout T) -> U) -> U {
        return self._lock.withLock { body(&self._val) }
    }
    
    @inlinable
    func writeVoid(_ body: (inout T) -> Void) {
        return self._lock.withLockVoid { body(&self._val) }
    }
    
    @inlinable
    func snapshot() -> T {
        return _val
    }
}
