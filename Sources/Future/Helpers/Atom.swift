import Foundation

@usableFromInline
final class Atom<T> {
    
    @usableFromInline
    let lock = Lock()

    @usableFromInline
    var _value: T
    
    @inlinable
    init(_ value: T) {
        self._value = value
    }
    
    @inlinable
    func get() -> T {
        self.lock.lock()
        defer { self.lock.unlock() }
        return self._value
    }
    
    @inlinable
    func set(_ new: T) {
        self.lock.lock()
        defer { self.lock.unlock() }
        self._value = new
    }
    
    @inlinable
    func withLock<R>(_ body: (T) throws -> R) rethrows -> R {
        self.lock.lock()
        defer { self.lock.unlock() }
        return try body(self._value)
    }
    
    @inlinable
    func withLockMutating<R>(_ body: (inout T) throws -> R) rethrows -> R {
        self.lock.lock()
        defer { self.lock.unlock() }
        return try body(&self._value)
    }
}

extension Atom where T: Equatable {
    
    @inlinable
    func compareAndSet(expected: T, new: T) -> Bool {
        return self.withLockMutating {
            if $0 == expected {
                $0 = new
                return true
            }
            return false
        }
    }
}

extension Atom where T: AdditiveArithmetic {
    
    @inlinable
    func add(_ val: T) -> T {
        return self.withLockMutating {
            let old = $0
            $0 += val
            return old
        }
    }
    
    @inlinable
    func sub(_ val: T) -> T {
        return self.withLockMutating {
            let old = $0
            $0 -= val
            return old
        }
    }
}

extension Atom where T: RangeReplaceableCollection {
    
    @inlinable
    func append(_ new: T.Element) -> T {
        return self.withLockMutating {
            $0.append(new)
            return $0
        }
    }
}
