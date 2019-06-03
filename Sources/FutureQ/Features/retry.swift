//
//  retry.swift
//  FutureQ
//
//  Created by Quentin Jin on 2019/6/1.
//

import Foundation

extension Thenable {
    
    @inlinable
    public static func retry<T>(count: Int, task: @escaping () -> Future<T>) -> Future<T> {
        guard count >= 1 else {
            return Future<T>.failure(FutureError.input)
        }
        return self._retry(count: count, task: task)
    }
    
    @inlinable
    static func _retry<T>(count: Int, task: @escaping () -> Future<T>) -> Future<T> {
        return task().flatMapError {
            if count == 0 {
                return Future<T>.failure($0)
            } else {
                return _retry(count: count - 1, task: task)
            }
        }
    }
}
