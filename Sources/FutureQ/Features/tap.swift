//
//  tap.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    @inlinable
    public func tap(_ body: @escaping (Result<Success, Failure>) -> Void) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete {
            body($0)
            p.complete($0)
        }
        
        return p.future
    }
    
    @inlinable
    public func tapValue(_ body: @escaping (Success) -> Void) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete {
            if case .success(let t) = $0 {
                body(t)
            }
            p.complete($0)
        }
        
        return p.future
    }
    
    @inlinable
    public func tapError(_ body: @escaping (Failure) -> Void) -> Future<Success, Failure> {
        let p = Promise<Success, Failure>()
        
        self.whenComplete {
            if case .failure(let e) = $0 {
                body(e)
            }
            p.complete($0)
        }
        
        return p.future
    }
}
