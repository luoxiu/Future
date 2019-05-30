//
//  Future.reduce.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func reduce<U>(on queue: DispatchQueue = .main, _ futures: [Future<T>], initial: Future<U>, nextPartial: @escaping (U, T) -> Future<U>) -> Future<U> {
        let b = futures.reduce(initial) { (fu, ft) -> Future<U> in
            return self.whenAllSucceed(on: queue, fu, ft).flatMap { ut in nextPartial(ut.0, ut.1) }
        }
        return b
    }
}
