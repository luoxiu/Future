import Foundation

final class Atomic<T> {
    
    @usableFromInline
    let lock = Lock()

    @usableFromInline
    var _value: T
    
    @inlinable
    init(_ value: T) {
        self._value = value
    }
    
    @inlinable
    func read<U>(_ body: (T) -> U) -> U {
        return self.lock.withLock { body(self._value) }
    }
    
    @inlinable
    func readVoid(_ body: (T) -> Void) {
        return self.lock.withLockVoid { body(self._value) }
    }
    
    @inlinable
    func write<U>(_ body: (inout T) -> U) -> U {
        return self.lock.withLock { body(&self._value) }
    }
    
    @inlinable
    func writeVoid(_ body: (inout T) -> Void) {
        return self.lock.withLockVoid { body(&self._value) }
    }
    
    @inlinable
    func snapshot() -> T {
        return self._value
    }
}
