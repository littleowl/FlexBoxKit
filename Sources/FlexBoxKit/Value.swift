//
//  Value.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/4/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

#if os(iOS) || os(watchOS) || os(tvOS) || os(OSX)
import CoreGraphics
#endif

public enum Value: RawRepresentable, Hashable {
    
    public static var zero: Value {
        return .point(0.0)
    }
    
    public enum Unit: String, CaseIterable, Hashable, Codable {
        case undefined
        case point
        case percent
        case auto
    }
    
    public struct RawValue: Hashable, Codable {
        public var value: Float
        public var unit: Unit
        
        public init(
            value: Float,
            unit: Unit)
        {
            self.value = value
            self.unit = unit
        }
    }
    
    case undefined
    case point(_ value: Float)
    case percent(_ value: Float)
    case auto
    
    public init(rawValue: Value.RawValue) {
        switch rawValue.unit {
        case .undefined:
            self = .undefined
        case .point:
            self = .point(rawValue.value)
        case .percent:
            self = .percent(rawValue.value)
        case .auto:
            self = .auto
        }
    }
    
    public var rawValue: Value.RawValue {
        switch self {
            
        case .undefined:
            return RawValue(value: 0.0, unit: .undefined)
        case .point(let value):
            return RawValue(value: value, unit: .point)
        case .percent(let value):
            return RawValue(value: value, unit: .percent)
        case .auto:
            return RawValue(value: 0.0, unit: .auto)
        }
    }
    
    public var value: Float? {
        switch self {
        case .undefined: return nil
        case .point(let value): return value
        case .percent(let value): return value
        case .auto: return nil
        }
    }
    
    public var unit: Unit {
        switch self {
        case .undefined: return .undefined
        case .point: return .point
        case .percent: return .percent
        case .auto: return .auto
        }
    }
    
    public func resolve(size: Float?) -> Float? {
        switch self {
        case .undefined: return nil
        case .point(let value): return value
        case .percent(let value):
            guard
                let inputSize = size,
                !(size ~= Float.greatestFiniteMagnitude)
                else { return nil }
            return value * inputSize * 0.01
        case .auto: return nil
        }
    }
    
}

extension Value: ExpressibleByFloatLiteral {
    public typealias FloatLiteralType = Float
    
    public init(floatLiteral value: Float) {
        self = .point(value)
    }
    
    public init(_ value: Float) {
        self = .point(value)
    }
    
    #if os(iOS) || os(watchOS) || os(tvOS) || os(OSX)
    public init(_ value: CGFloat) {
        self = .point(Float(value))
    }
    #endif
    
    public init(_ value: Double) {
        self = .point(Float(value))
    }
}

extension Value: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self = .undefined
    }
}

extension Value: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int
    
    public init(integerLiteral value: Int) {
        self = .point(Float(value))
    }
}


extension Value: Codable {

    public enum CodingKeys: String, CodingKey {
        case rawValue
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let rawValue = try container.decode(RawValue.self, forKey: .rawValue)
        self.init(rawValue: rawValue)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(rawValue, forKey: .rawValue)
    }

}

postfix operator %

extension Float {
    public static postfix func %(value: Float) -> Value {
        return .percent(value)
    }
}

extension Double {
    public static postfix func %(value: Double) -> Value {
        return .percent(Float(value))
    }
}

extension Int {
    public static postfix func %(value: Int) -> Value {
        return .percent(Float(value))
    }
}

#if os(iOS) || os(watchOS) || os(tvOS) || os(OSX)
extension CGFloat {
    public static postfix func %(value: CGFloat) -> Value {
        return .percent(Float(value))
    }
}
#endif
