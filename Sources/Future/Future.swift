import Foundation

public typealias FutureN<Success> = Future<Success, Never>
public typealias FutureE<Success> = Future<Success, Error>

public final class Future<Success, Failure>: Thenable where Failure : Error {
    
    @usableFromInline
    let lock = Lock()
    
    @usableFromInline
    var _callbacks = CallbackList()
    
    @usableFromInline
    var _isPending: Bool

    @usableFromInline
    var _result: Result<Success, Failure>?
    
    @inlinable
    public var isPending: Bool {
        return self.lock.withLock { self._isPending }
    }
    
    @inlinable
    public var isCompleted: Bool {
        return !self.isPending
    }
    
    @inlinable
    public func inspect() -> Result<Success, Failure>? {
        return self.lock.withLock { self._result }
    }
    
    @inlinable
    public func inspectRoughly() -> Result<Success, Failure>? {
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
            ._run()
    }
    
    @inlinable
    func _whenComplete(_ callback: @escaping () -> CallbackList) -> CallbackList {
        guard self._isPending else {
            return callback()
        }
        
        self._callbacks._append(callback)
        return CallbackList()
    }
    
    @inlinable
    public func whenComplete(_ callback: @escaping (Result<Success, Failure>) -> Void) {
        self.lock
            .withLock {
                self._whenComplete { [unowned self] in
                    callback(self._result!)
                    return CallbackList()
                }
            }
            ._run()
    }
    
    deinit {
        if self._isPending {
            print("An uncompleted promise leaked.")
        }
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
    typealias E = () -> CallbackList
    
    @usableFromInline
    var _one: E?
    
    @usableFromInline
    var _others: [E]?
    
    @inlinable
    var _count: Int {
        return (_one == nil ? 0 : 1) + (_others?.count ?? 0)
    }
    
    @inlinable
    init() {
    }
    
    @inlinable
    mutating func _append(_ callback: @escaping E) {
        if self._one == nil {
            self._one = callback
        } else {
            if self._others == nil {
                self._others = [callback]
            } else {
                self._others!.append(callback)
            }
        }
    }
    
    @inlinable
    func _allCallbacks() -> [E] {
        switch (self._one, self._others) {
        case (.none, _):
            return []
        case (.some(let cb), .none):
            return [cb]
        case (.some(let cb), .some(let cbs)):
            return [cb] + cbs
        }
    }
    
    @inlinable
    func _run() {
        switch (self._one, self._others) {
        case (.none, _):
            break
        case (.some(let cb), .none):
            var cbList = cb()
            loop: while true {
                switch (cbList._one, cbList._others) {
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
                            next.append(contentsOf: cb()._allCallbacks())
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
                    next.append(contentsOf: cb()._allCallbacks())
                }
            }
        }
    }
}
