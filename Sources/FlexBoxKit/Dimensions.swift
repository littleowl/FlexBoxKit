//
//  Dimensions.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/4/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

public struct Size: Hashable, Codable {
    public var width: Float
    public var height: Float
    
    public init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
    
    public static var zero: Size {
        return .init(width: 0.0, height: 0.0)
    }
}

public enum Dimension: String, CaseIterable, Hashable, Codable {
    case width
    case height
}

public struct Dimensions: Hashable, Codable {
    
    public static let count: Int = 2
    
    public var width: Value
    public var height: Value
    
    public static var undefined: Dimensions {
        return Dimensions(.undefined, .undefined)
    }
    
    public init(_ first: Value, _ second: Value) {
        self.width = first
        self.height = second
    }
    
    subscript(place: Int) -> Value {
        get {
            if place % Dimensions.count == 0 {
                return width
            } else {
                return height
            }
        }
        
        set {
            if place % Dimensions.count == 0 {
                width = newValue
            } else {
                height = newValue
            }
        }
    }
    
    subscript(place: Dimension) -> Value {
        get {
            switch place {
            case .width: return width
            case .height: return height
            }
        }
        
        set {
            switch place {
            case .width: width = newValue
            case .height: height = newValue
            }
        }
    }
}

public enum Direction: String, CaseIterable, Hashable, Codable {
    case inherit
    case leftToRight
    case rightToLeft
}

public enum Align: String, CaseIterable, Hashable, Codable {
    case auto
    case flexStart
    case center
    case flexEnd
    case stretch
    case baseline
    case spaceBetween
    case spaceAround
}

public enum Display: String, CaseIterable, Hashable, Codable {
    case flex
    case none
}

public enum FlexDirection: String, CaseIterable, Hashable, Codable {
    case column
    case reverse
    case row
    case rowReverse
    
    public var positionEdge: Edge {
        switch self {
        case .column: return .top
        case .reverse: return .bottom
        case .row: return .left
        case .rowReverse: return .right
        }
    }
    
    public var leading: Edge {
        switch self {
        case .column: return .top
        case .reverse: return .bottom
        case .row: return .left
        case .rowReverse: return .right
        }
    }
    
    public var leadingDirection: FlexDirection {
        switch self {
        case .column: return .column
        case .reverse: return .reverse
        case .row: return .row
        case .rowReverse: return .rowReverse
        }
    }
    
    public var trailingDirection: FlexDirection {
        switch self {
        case .column: return .reverse
        case .reverse: return .column
        case .row: return .rowReverse
        case .rowReverse: return .row
        }
    }
    
    public var trailing: Edge {
        switch self {
        case .column: return .bottom
        case .reverse: return .top
        case .row: return .right
        case .rowReverse: return .left
        }
    }
    
    public var isRow: Bool {
        switch self {
        case .column: return false
        case .reverse: return false
        case .row: return true
        case .rowReverse: return true
        }
    }
    
    public var isColumn: Bool {
        switch self {
        case .column: return true
        case .reverse: return true
        case .row: return false
        case .rowReverse: return false
        }
    }
    
    public var dimension: Dimension {
        switch self {
        case .column: return .height
        case .reverse: return .height
        case .row: return .width
        case .rowReverse: return .width
        }
    }
    
    public func resolve(
        direction: Direction
        ) -> FlexDirection
    {
        if direction == .rightToLeft {
            if self == .row {
                return .rowReverse
            } else if self == .rowReverse {
                return .row
            }
        }
        return self
    }
    
    public func cross(direction: Direction) -> FlexDirection {
        if self.isColumn {
            return FlexDirection.row.resolve(direction: direction)
        } else {
            return .column
        }
    }
    
}

public enum Justify: String, CaseIterable, Hashable, Codable {
    case flexStart
    case center
    case flexEnd
    case spaceBetween
    case spaceAround
    case spaceEvenly
}

public enum LogLevel: String, CaseIterable, Hashable, Codable {
    case error
    case warn
    case info
    case debug
    case verbose
    case fatal
}

public enum MeasureMode: String, CaseIterable, Hashable, Codable {
    case undefined
    case exactly
    case atMost
}

public enum FlexNodeType: RawRepresentable, Codable, Equatable, Hashable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let rawValue = try container.decode(RawValue.self, forKey: .rawValue)
        let value = FlexNodeType.init(rawValue: rawValue) ?? .custom(rawValue)
        self = value
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.rawValue, forKey: .rawValue)
    }
    
    public enum CodingKeys: CodingKey {
        case rawValue
    }
    
    public struct RawValue: Equatable, Codable, Hashable {
        public var value: String
        public var isText: Bool
    }
    
    case `default`
    case text
    case test
    case custom(RawValue)
    
    public var isText: Bool {
        switch self {
        case .default:
            return false
        case .text:
            return true
        case .test:
            return true
        case .custom(let rawValue):
            return rawValue.isText
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue.value {
        case "text":
            self = .text
        case "default":
            self =  .default
        default:
            self = .custom(rawValue)
        }
    }
    
    public var rawValue: RawValue {
        switch self {
        case .default:
            return RawValue(value: "default", isText: false)
        case .text:
            return RawValue(value: "text", isText: false)
        case .test:
            return RawValue(value: "test", isText: false)
        case .custom(let raw):
            return raw
        }
    }
}

public enum Overflow: String, CaseIterable, Hashable, Codable {
    case visible
    case hidden
    case scroll
}

public enum Position: String, CaseIterable, Hashable, Codable {
    case relative
    case absolute
}

public enum PrintOptions: String, CaseIterable, Hashable, Codable {
    case layout
    case style
    case children
}

public enum Wrap: String, CaseIterable, Hashable, Codable {
    case noWrap
    case wrap
    case wrapReverse
}
