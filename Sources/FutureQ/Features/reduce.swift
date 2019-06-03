//
//  reduce.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public static func reduce<S: Sequence, U>(_ thenables: S, initial: U, nextPartial: @escaping (U, S.Element.T) -> Future<U>) -> Future<U> where S.Element: Thenable {
        return self.reduce(thenables, initial: Future<U>.success(initial), nextPartial: nextPartial)
    }
    
    @inlinable
    public static func reduce<S: Sequence, U: Thenable>(_ thenables: S, initial: U, nextPartial: @escaping (U.T, S.Element.T) -> Future<U.T>) -> Future<U.T> where S.Element: Thenable {
        return thenables.reduce(initial.toFuture()) { (fu, ft) -> Future<U.T> in
            return whenAllSucceed(fu, ft).flatMapValue { (ut) in
                return nextPartial(ut.0, ut.1)
            }
        }
    }
}
