//
//  tap.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func tap(_ body: @escaping (Result<T, Error>) -> Void) -> Future<T> {
        let p = Promise<T>()
        
        self.whenComplete {
            body($0)
            p.complete($0)
        }
        
        return p.future
    }
    
    @inlinable
    public func tapValue(_ body: @escaping (T) -> Void) -> Future<T> {
        let p = Promise<T>()
        
        self.whenComplete {
            if case .success(let t) = $0 {
                body(t)
            }
            p.complete($0)
        }
        
        return p.future
    }
    
    @inlinable
    public func tapError(_ body: @escaping (Error) -> Void) -> Future<T> {
        let p = Promise<T>()
        
        self.whenComplete {
            if case .failure(let e) = $0 {
                body(e)
            }
            p.complete($0)
        }
        
        return p.future
    }
}
