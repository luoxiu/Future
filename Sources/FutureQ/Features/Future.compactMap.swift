//
//  Future.compactMap.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func compactMap(on queue: DispatchQueue = .main, _ futures: [Future<T>], body: @escaping (T) -> Future<T>) -> Future<[T]> {
        let fs = futures.map { $0.flatMap(body) }
        return self.compact(on: queue, fs)
    }
}
