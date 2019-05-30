//
//  Future.race.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    // Alias for `whenAnyComplete`.
    public static func race(on queue: DispatchQueue = .main, _ futures: [Future<T>]) -> Future<T> {
        return self.whenAnyComplete(on: queue, futures)
    }
}
