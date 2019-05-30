//
//  Future.each.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func each(on queue: DispatchQueue = .main, _ futures: [Future<T>], body: @escaping (T) -> Void) -> Future<Void> {
        let fs = futures.map { $0.map(body) }
        return whenAllCompleteVoid(on: queue, fs)
    }
}
