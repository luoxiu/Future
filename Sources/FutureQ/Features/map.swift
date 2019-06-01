//
//  map.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {

    @inlinable
    public func map<U>(_ body: @escaping (Result<T, Error>) throws -> U) -> Future<U> {
        let p = Promise<U>()
        self.whenComplete { r in
            do {
                p.succeed(try body(r))
            } catch let e {
                p.fail(e)
            }
        }
        return p.future
    }
    
    @inlinable
    public func mapValue<U>(_ body: @escaping (T) throws -> U) -> Future<U> {
        let p = Promise<U>()
        self.whenComplete { r in
            switch r {
            case .success(let t):
                do {
                    p.succeed(try body(t))
                } catch let e {
                    p.fail(e)
                }
            case .failure(let e):
                p.fail(e)
            }
        }
        return p.future
    }
    
    @inlinable
    public func mapError(_ body: @escaping (Error) throws -> T) -> Future<T> {
        let p = Promise<T>()
        self.whenComplete { r in
            switch r {
            case .success(let t):
                p.succeed(t)
            case .failure(let e):
                do {
                    p.succeed(try body(e))
                } catch let e {
                    p.fail(e)
                }
            }
        }
        return p.future
    }
}
