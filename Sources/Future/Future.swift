import Foundation

/// A Future represents an eventual result of an asynchronous operation.
public final class Future<Success, Failure>: Thenable where Failure : Error {
    
    @usableFromInline
    let lock = Lock()
    
    @usableFromInline
    var _callbacks = CallbackList()
    
    @usableFromInline
    var _isPending: Bool

    @usableFromInline
    var _result: Result<Success, Failure>?
    
    /// Return true if the future is pending.
    @inlinable
    public var isPending: Bool {
        return self.lock.withLock { self._isPending }
    }
    
    /// Return true if the future is completed.
    @inlinable
    public var isCompleted: Bool {
        return !self.isPending
    }
    
    /// Inspect the future atomically, return nil if the future is pending.
    @inlinable
    public func inspect() -> Result<Success, Failure>? {
        return self.lock.withLock { self._result }
    }
    
    /// Inspect the future nonatomically, return nil if the future is pending.
    @inlinable
    public func inspectWithoutLock() -> Result<Success, Failure>? {
        return self._result
    }

    @inlinable
    init() {
        self._isPending = true
    }
    
    @inlinable
    public init(result: @autoclosure () -> Result<Success, Failure>) {
        self._result = result()
        self._isPending = false
    }
    
    @inlinable
    func _complete(_ result: Result<Success, Failure>) -> CallbackList {
        guard self._isPending else {
            return CallbackList()
        }
        
        self._result = result
        self._isPending = false
        
        defer {
            self._callbacks = CallbackList()
        }
        return self._callbacks
    }

    @inlinable
    func complete(_ result: Result<Success, Failure>) {
        self.lock
            .withLock {
                self._complete(result)
            }
            .run()
    }
    
    @inlinable
    func _whenComplete(_ callback: @escaping () -> CallbackList) -> CallbackList {
        guard self._isPending else {
            return callback()
        }
        
        self._callbacks.append(callback)
        return CallbackList()
    }
    
    /// Add a callback to the future that will be called when the future is completed.
    @inlinable
    public func whenComplete(_ callback: @escaping (Result<Success, Failure>) -> Void) {
        self.lock
            .withLock {
                self._whenComplete { [unowned self] in
                    callback(self._result!)
                    return CallbackList()
                }
            }
            .run()
    }
}

extension Future {
    
    @inlinable
    public static func success(_ success: Success) -> Future {
        return Future(result: .success(success))
    }
    
    @inlinable
    public static func failure(_ failure: Failure) -> Future {
        return Future(result: .failure(failure))
    }
}

@usableFromInline
struct CallbackList {
    
    @usableFromInline
    typealias Element = () -> CallbackList
    
    @usableFromInline
    var first: Element? = nil
    
    @usableFromInline
    var further: [Element]? = nil
        
    @inlinable
    init() { }
    
    @inlinable
    mutating func append(_ callback: @escaping Element) {
        if self.first == nil {
            self.first = callback
        } else {
            if self.further == nil {
                self.further = [callback]
            } else {
                self.further!.append(callback)
            }
        }
    }
    
    @inlinable
    func all() -> [Element] {
        switch (self.first, self.further) {
        case (.none, _):
            return []
        case (.some(let cb), .none):
            return [cb]
        case (.some(let cb), .some(let cbs)):
            var arr: [Element] = []
            arr.reserveCapacity(cbs.count + 1)
            arr.append(cb)
            arr.append(contentsOf: cbs)
            return arr
        }
    }
    
    @inlinable
    func run() {
        switch (self.first, self.further) {
        case (.none, _):
            break
        case (.some(let cb), .none):
            var cbList = cb()
            loop: while true {
                switch (cbList.first, cbList.further) {
                case (.none, _):
                    break loop
                case (.some(let cb), .none):
                    cbList = cb()
                    continue loop
                case (.some(let cb), .some(let cbs)):
                    var next = [cb] + cbs
                    while next.count > 0 {
                        let pending = next
                        next = []
                        for cb in pending {
                            next.append(contentsOf: cb().all())
                        }
                    }
                    break loop
                }
            }
        case (.some(let cb), .some(let cbs)):
            var next = [cb] + cbs
            while next.count > 0 {
                let pending = next
                next = []
                for cb in pending {
                    next.append(contentsOf: cb().all())
                }
            }
        }
    }
}

extension CallbackList {
    
    struct List {
        
        var storage: [Element]
        
        init() {
            storage = []
            storage.reserveCapacity(4)
        }
        
        init(_ elements: [Element]) {
            storage = elements
        }
        
        
        mutating func append(_ element: @escaping Element) {
            if storage.count == storage.capacity {
                storage.reserveCapacity(storage.capacity + 1)
            }
            
            storage.append(element)
        }
        
        mutating func append(_ elements: [Element]) {
            if storage.count + elements.count > storage.capacity {
                storage.reserveCapacity(storage.count + elements.count)
            }
            
            storage.append(contentsOf: elements)
        }
    }
}
