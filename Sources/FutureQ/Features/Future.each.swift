//
//  Future.each.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    public static func each<T>(_ futures: [Future<T>], body: @escaping (Result<T, Error>) -> Void) -> Future<Void> {
        return whenAllComplete(futures).map {
            for r in $0 {
                body(r)
            }
        }
    }
    
    public static func each<T>(_ futures: [Future<T>], body: @escaping (T) -> Void) -> Future<Void> {
        return whenAllComplete(futures).map {
            for r in $0 {
                if case .success(let t) = r {
                    body(t)
                }
            }
        }
    }
}
