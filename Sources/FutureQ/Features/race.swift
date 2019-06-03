//
//  race.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Thenable {
    
    // Alias for `whenAnyComplete`.
    public static func race<T: Thenable>(_ futures: [T]) -> Future<T.T> {
        return self.whenAnyComplete(futures)
    }
}
