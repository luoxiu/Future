//
//  reduce.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    public static func reduce<T: Thenable, U>(_ futures: [T], initial: U, nextPartial: @escaping (U, T.T) -> Future<U>) -> Future<U> {
        return self.reduce(futures, initial: Future<U>.success(initial), nextPartial: nextPartial)
    }
    
    public static func reduce<T: Thenable, U: Thenable>(_ futures: [T], initial: U, nextPartial: @escaping (U.T, T.T) -> Future<U.T>) -> Future<U.T> {
        return futures.reduce(initial.toFuture()) { (fu, ft) -> Future<U.T> in
            return whenAllSucceed(fu, ft).flatMapValue { (ut) in
                return nextPartial(ut.0, ut.1)
            }
        }
    }
}
