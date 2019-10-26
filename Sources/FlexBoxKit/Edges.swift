//
//  Edges.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/4/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

public enum Edge: String, CaseIterable, Hashable, Codable {
    case left
    case top
    case right
    case bottom
    case start
    case end
    case horizontal
    case vertical
    case all
    
    public var intValue: Int {
        switch self {
        case .left: return 0
        case .top: return 1
        case .right: return 2
        case .bottom: return 3
        case .start: return 4
        case .end: return 5
        case .horizontal: return 6
        case .vertical: return 7
        case .all: return 8
        }
    }
    
    public var horizontalOrVertical: Edge {
        switch self {
        case .left: return .horizontal
        case .top: return .vertical
        case .right: return .horizontal
        case .bottom: return .vertical
        case .start: return .horizontal
        case .end: return .horizontal
        case .horizontal: return .horizontal
        case .vertical: return .vertical
        case .all: return .horizontal
        }
    }
}

public struct Edges: Equatable, Codable {
    
    public var left: Value = .undefined
    public var top: Value = .undefined
    public var right: Value = .undefined
    public var bottom: Value = .undefined
    public var start: Value = .undefined
    public var end: Value = .undefined
    public var horizontal: Value = .undefined
    public var vertical: Value = .undefined
    public var all: Value = .undefined
    
    public init() {}
    
    public init(
        left: Value,
        top: Value,
        right: Value,
        bottom: Value,
        start: Value,
        end: Value,
        horizontal: Value,
        vertical: Value,
        all: Value)
    {
        self.left = left
        self.top = top
        self.right = right
        self.bottom = bottom
        self.start = start
        self.end = end
        self.horizontal = horizontal
        self.vertical = vertical
        self.all = all
    }
    
    public subscript(edge: Edge) -> Value {
        get {
            switch edge {
            case .left: return left
            case .top: return top
            case .right: return right
            case .bottom: return bottom
            case .start: return start
            case .end: return end
            case .horizontal: return horizontal
            case .vertical: return vertical
            case .all: return all
            }
        }
        set {
            switch edge {
            case .left: left = newValue
            case .top: top = newValue
            case .right: right = newValue
            case .bottom: bottom = newValue
            case .start: start = newValue
            case .end: end = newValue
            case .horizontal: horizontal = newValue
            case .vertical: vertical = newValue
            case .all: all = newValue
            }
        }
    }
    
}

extension Edges {
    internal func compute(
        edge: Edge,
        withDefault defaultValue: Value)
        -> Value
    {
        guard
            self[edge] == .undefined
            else { return self[edge] }
        
        if
            self.vertical != .undefined,
            (edge == .top || edge == .bottom)
        {
            return self.vertical
        }
        
        if
            self.horizontal != .undefined,
            (edge == .left || edge == .right || edge == .start || edge == .end)
        {
            return self.horizontal
        }
        
        if self.all != .undefined {
            return self.all
        }
        
        guard
            edge != .start,
            edge != .end
            else {
                return .undefined
        }
        
        return defaultValue
    }
}
