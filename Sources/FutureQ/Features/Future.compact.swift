//
//  Future.compact.swift
//  Alice
//
//  Created by Quentin Jin on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func compact(on queue: DispatchQueue = .main, _ futures: [Future<T>]) -> Future<[T]> {
        let p = Promise<[T]>(on: queue)
        self.whenAllComplete(on: queue, futures).whenComplete { _ in
            p.succeed(futures.compactMap { $0._value })
        }
        return p.future
    }
}
