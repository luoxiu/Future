//
//  Future.swift
//  SwiftDemo
//
//  Created by Quentin MED on 2019/3/26.
//  Copyright © 2019 Quentin. All rights reserved.
//

import Foundation

public final class Future<T> {
    
    @usableFromInline
    let _lock = Lock()
    
    @usableFromInline
    var _callbacks = _CallbackList()
    
    @usableFromInline
    var _isPending: Bool

    @usableFromInline
    var _result: Result<T, Error>? {
        willSet {
            assert(newValue != nil, "Trying to pass nil to result.")
            assert(_isPending, "Trying to pass result when future was already completed.")
        }
        didSet {
            _isPending = false
        }
    }
    
    @usableFromInline
    var _value: T? {
        if case .success(let t)? = _result {
            return t
        }
        return nil
    }
    
    @usableFromInline
    var _error: Error? {
        if case .failure(let e)? = _result {
            return e
        }
        return nil
    }

    @inlinable
    public var result: Result<T, Error>? {
        return self._lock.withLock { _result }
    }
    
    @inlinable
    public var value: T? {
        return self._lock.withLock { _value }
    }
    
    @inlinable
    public var error: Error? {
        return self._lock.withLock { _error }
    }
    
    @inlinable
    public var isCompleted: Bool {
        return !self.isPending
    }
    
    @inlinable
    public var isPending: Bool {
        return self._lock.withLock { _isPending }
    }
    
    public let queue: DispatchQueue
    
    @inlinable
    init(on queue: DispatchQueue = .main) {
        self.queue = queue
        self._isPending = true
    }
    
    @inlinable
    public init(on queue: DispatchQueue = .main, result: Result<T, Error>) {
        self.queue = queue
        self._result = result
        self._isPending = false
    }
    
    @inlinable
    public convenience init(on queue: DispatchQueue = .main, success: T) {
        self.init(on: queue, result: .success(success))
    }
    
    @inlinable
    public convenience init(on queue: DispatchQueue = .main, failure: Error) {
        self.init(on: queue, result: .failure(failure))
    }
    
    @inlinable
    public static func success(_ t: T, on queue: DispatchQueue = .main) -> Future {
        return Future(on: queue, success: t)
    }
    
    @inlinable
    public static func failure(_ e: Error, on queue: DispatchQueue = .main) -> Future {
        return Future(on: queue, failure: e)
    }
    
    @inlinable
    func _complete(_ result: Result<T, Error>) -> _CallbackList {
        guard self._isPending else {
            return _CallbackList()
        }
        
        self._result = result
        
        let cbs = self._callbacks
        self._callbacks = _CallbackList()
        return cbs
    }

    @inlinable
    public func complete(_ result: Result<T, Error>) {
        
        let cbList = self._lock.withLock {
            self._complete(result)
        }
        self.queue.async {
            cbList._run()
        }
    }
    
    @inlinable
    func _whenComplete(_ callback: @escaping () -> _CallbackList) -> _CallbackList {
        guard self._isPending else {
            return callback()
        }
        self._callbacks._append(callback)
        return _CallbackList()
    }
    
    @inlinable
    public func whenComplete(_ callback: @escaping (Result<T, Error>) -> Void) {
        let cbList = self._lock.withLock {
            self._whenComplete {
                callback(self._result!)
                return _CallbackList()
            }
        }
        self.queue.async {
            cbList._run()
        }
    }
    
    @inlinable
    public func whenSuccess(_ callback: @escaping (T) -> Void) {
        self.whenComplete { r in
            if case .success(let t) = r {
                callback(t)
            }
        }
    }
    
    @inlinable
    public func whenFailure(_ callback: @escaping (Error) -> Void) {
        self.whenComplete { r in
            if case .failure(let e) = r {
                callback(e)
            }
        }
    }
    
    deinit {
        assert(isCompleted, "Leaking an uncompleted promise.")
    }
}

extension Future: Equatable {

    public static func == (lhs: Future, rhs: Future) -> Bool {
        return lhs === rhs
    }
}

@usableFromInline
struct _CallbackList {
    
    @usableFromInline
    typealias E = () -> _CallbackList
    
    @usableFromInline
    var _callback: E?
    
    @usableFromInline
    var _callbackArray: [E]?
    
    @inlinable
    init() { }
    
    @inlinable
    mutating func _append(_ callback: @escaping E) {
        if self._callback == nil {
            self._callback = callback
        } else {
            if self._callbackArray == nil {
                self._callbackArray = [callback]
            } else {
                self._callbackArray!.append(callback)
            }
        }
    }
    
    @inlinable
    func _allCallbacks() -> [E] {
        switch (self._callback, self._callbackArray) {
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
        switch (self._callback, self._callbackArray) {
        case (.none, _):
            break
        case (.some(let cb), .none):
            var cbList = cb()
            loop: while true {
                switch (cbList._callback, cbList._callbackArray) {
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
