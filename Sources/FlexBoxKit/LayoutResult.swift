//
//  Layout.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/4/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

public struct LayoutResult: Equatable, Codable {
    
    public var position: LayoutPosition = .init()
    
    public var dimensions: LayoutDimensions = .init()
    
    public var width: Float {
        get { return dimensions.width }
    }
    
    public var height: Float {
        get { return dimensions.height }
    }
    
    public var margin: LayoutEdges = .init()
    public var border: LayoutEdges = .init()
    public var padding: LayoutEdges = .init()
    
    public var direction: Direction = .inherit
    
    public var computedFlexBasisGeneration: Int = 0
    
    public var computedFlexBasis: Float? = nil
    
    public var hasOverflow: Bool = false
    
    // Instead of recomputing the entire layout every single time, we
    // cache some information to break early when nothing changed
    public var generationCount: Int = 0
    
    // YGDirection lastOwnerDirection = (YGDirection)-1;
    public var lastOwnerDirection: Direction? = nil
    
    public var nextCachedMeasurementsIndex: Int = 0
    
    public static var maxCachedResultCount: Int = 16
    internal var cachedMeasurements: [CachedMeasurement] = []
    
    public var measuredDimensions: LayoutDimensions = .init()
    
    internal var cachedLayout: CachedMeasurement? = nil
    
    public internal(set) var lineIndex: Int = 0
    
    public init() {}
    
    public func marginEdge(_ edge: Edge) -> Float? {
        switch edge {
        case .left:
            return margin.left(from: direction)
        case .top:
            return margin.top
        case .right:
            return margin.right(from: direction)
        case .bottom:
            return margin.bottom
        case .start:
            return margin.start
        case .end:
            return margin.end
        case .horizontal:
            return nil
        case .vertical:
            return nil
        case .all:
            return nil
        }
    }
    
    public func paddingEdge(_ edge: Edge) -> Float? {
        switch edge {
        case .left:
            return padding.left(from: direction)
        case .top:
            return padding.top
        case .right:
            return padding.right(from: direction)
        case .bottom:
            return padding.bottom
        case .start:
            return padding.start
        case .end:
            return padding.end
        case .horizontal:
            return nil
        case .vertical:
            return nil
        case .all:
            return nil
        }
    }

}

public struct LayoutPosition: Equatable, Codable {
    
    private var _left: Float
    private var _top: Float
    private var _right: Float
    private var _bottom: Float
    
    public var left: Float {
        get { return _left }
        set {
            _left = newValue
        }
    }
    public var top: Float {
        get { return _top }
        set {
            _top = newValue
        }
    }
    public var right: Float {
        get { return _right }
        set {
            _right = newValue
        }
    }
    public var bottom: Float {
        get { return _bottom }
        set {
            _bottom = newValue
        }
    }
    
    public init() {
        self._left = 0.0
        self._top = 0.0
        self._right = 0.0
        self._bottom = 0.0
    }
    
    public init(
        left: Float,
        top: Float,
        right: Float,
        bottom: Float)
    {
        self._left = left
        self._top = top
        self._right = right
        self._bottom = bottom
    }
    
    public subscript(direction: FlexDirection) -> Float {
        get {
            switch direction {
            case .column: return top
            case .reverse: return bottom
            case .row: return left
            case .rowReverse: return right
            }
        }
        
        set {
            switch direction {
            case .column: top = newValue
            case .reverse: bottom = newValue
            case .row: left = newValue
            case .rowReverse: right = newValue
            }
        }
    }
    
    public subscript(trailing direction: FlexDirection) -> Float {
        get {
            switch direction {
            case .column: return bottom
            case .reverse: return top
            case .row: return right
            case .rowReverse: return left
            }
        }
        
        set {
            switch direction {
            case .column: bottom = newValue
            case .reverse: top = newValue
            case .row: right = newValue
            case .rowReverse: left = newValue
            }
        }
    }
}

public struct LayoutDimensions: Equatable, Codable {
    private var _width: Float
    private var _height: Float
    
    public var width: Float {
        get { return _width }
        set {
            _width = newValue
        }
    }
    public var height: Float {
        get { return _height }
        set {
            _height = newValue
        }
    }
    
    public init() {
        self._width = 0.0
        self._height = 0.0
    }
    
    public init(
        width: Float,
        height: Float)
    {
        self._width = width
        self._height = height
    }
    
    public subscript(dimension: Dimension) -> Float {
        get {
            switch dimension {
            case .width: return width
            case .height: return height
            }
        }
        
        set {
            switch dimension {
            case .width: width = newValue
            case .height: height = newValue
            }
        }
    }
    
}

public struct LayoutEdges: Equatable, Codable {
    public var start: Float
    public var end: Float
    public var top: Float
    public var bottom: Float
    
    public init() {
        self.start = 0.0
        self.end = 0.0
        self.top = 0.0
        self.bottom = 0.0
    }
    
    public init(
        start: Float,
        end: Float,
        top: Float,
        bottom: Float)
    {
        self.start = start
        self.end = end
        self.top = end
        self.bottom = end
    }
    
    public subscript(direction: FlexDirection) -> Float {
        get {
            switch direction {
            case .column: return top
            case .reverse: return bottom
            case .row: return start
            case .rowReverse: return end
            }
        }
        
        set {
            switch direction {
            case .column: top = newValue
            case .reverse: bottom = newValue
            case .row: start = newValue
            case .rowReverse: end = newValue
            }
        }
    }
    
    public func left(from direction: Direction) -> Float {
        switch direction {
        case .inherit:
            return start
        case .leftToRight:
            return start
        case .rightToLeft:
            return end
        }
    }
    
    public func right(from direction: Direction) -> Float {
        switch direction {
        case .inherit:
            return end
        case .leftToRight:
            return end
        case .rightToLeft:
            return start
        }
    }
}
