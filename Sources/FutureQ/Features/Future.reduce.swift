//
//  Future.reduce.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func reduce<T, U>(_ futures: [Future<T>], initial: U, nextPartial: @escaping (U, T) -> Future<U>) -> Future<U> {
        return self.reduce(futures, initial: Future<U>.success(initial), nextPartial: nextPartial)
    }
    
    public static func reduce<T, U>(_ futures: [Future<T>], initial: Future<U>, nextPartial: @escaping (U, T) -> Future<U>) -> Future<U> {
        return futures.reduce(initial) { (fu, ft) -> Future<U> in
            return self.whenAllSucceed(fu, ft).flatMap { ut in nextPartial(ut.0, ut.1) }
        }
    }
}
