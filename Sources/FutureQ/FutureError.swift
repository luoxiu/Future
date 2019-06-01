//
//  FutureError.swift
//  Future
//
//  Created by Quentin MED on 2019/4/11.
//

import Foundation

public enum FutureError: Swift.Error {
    
    case cancel
    case validate
    case timeout
    
    case input
}
