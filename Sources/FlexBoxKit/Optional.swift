//
//  Optional.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/4/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

extension Optional where Wrapped == Float {
    static func +(lhs: Float?, rhs: Float?) -> Float? {
        guard
            let left = lhs,
            let right = rhs else { return nil }
        return left + right
    }
    
    static func -(lhs: Float?, rhs: Float?) -> Float? {
        guard
            let left = lhs,
            let right = rhs else { return nil }
        return left - right
    }
    
    static func *(lhs: Float?, rhs: Float?) -> Float? {
        guard
            let left = lhs,
            let right = rhs else { return nil }
        return left * right
    }
    
    static func /(lhs: Float?, rhs: Float?) -> Float? {
        guard
            let left = lhs,
            let right = rhs else { return nil }
        return left / right
    }
    
    static func >(lhs: Float?, rhs: Float?) -> Bool {
        guard
            let left = lhs,
            let right = rhs else { return false }
        return left > right
    }
    
    static func <(lhs: Float?, rhs: Float?) -> Bool {
        guard
            let left = lhs,
            let right = rhs else { return false }
        return left < right
    }
    
    static func >=(lhs: Float?, rhs: Float?) -> Bool {
        guard
            let left = lhs,
            let right = rhs else { return false }
        return left >= right
    }
    
    static func <=(lhs: Float?, rhs: Float?) -> Bool {
        guard
            let left = lhs,
            let right = rhs else { return false }
        return left <= right
    }
}

//func max(_ lhs: Float?, _ rhs: Float?) -> Float? {
//    guard
//        let left = lhs,
//        let right = rhs
//        else { return nil }
//
//    return max(left, right)
//}

func max(_ lhs: Float?, _ rhs: Float) -> Float {
    guard
        let left = lhs
        else { return rhs }
    
    return max(left, rhs)
}

//func min(_ lhs: Float?, _ rhs: Float) -> Float? {
//    guard
//        let left = lhs,
//        let right = rhs
//        else { return nil }
//
//    return min(left, right)
//}

func min(_ lhs: Float?, _ rhs: Float) -> Float {
    guard
        let left = lhs
        else { return rhs }
    
    return min(left, rhs)
}


