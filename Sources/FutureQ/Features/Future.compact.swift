//
//  Future.compact.swift
//  Alice
//
//  Created by Quentin Jin on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func compact<T>(_ futures: [Future<T>]) -> Future<[T]> {
        let p = Promise<[T]>()
        self.whenAllComplete(futures).whenComplete { _ in
            p.succeed(futures.compactMap { $0._value })
        }
        return p.future
    }
    
    public static func compactMap<T, U>(_ futures: [Future<T>], body: @escaping (T) -> Future<U>) -> Future<[U]> {
        let fs = futures.map { $0.flatMap(body) }
        return self.compact(fs)
    }
}
