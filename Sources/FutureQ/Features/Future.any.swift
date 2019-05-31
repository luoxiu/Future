//
//  Future.any.swift
//  Alice
//
//  Created by Quentin MED on 2019/3/28.
//

import Foundation

extension Future {
    
    // Alias for whenAnyComplete
    public static func any(_ futures: [Future<T>]) -> Future<T> {
        return whenAnyComplete(futures)
    }
}
