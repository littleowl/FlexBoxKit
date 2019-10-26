//
//  Box.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 1/3/19.
//  Copyright © 2019 Takkido. All rights reserved.
//

import Foundation

public struct Box {
    
    /// The name given to this box. Useful for debugging.
    public var name: String? = nil
    
    public var style: FlexBox = .init() {
        didSet {
            makeDirty()
        }
    }
    
    public var layout: LayoutResult = .init()
    
    public var computedLayout: LayoutResult {
        return layout
    }
    
    public var isDirty: Bool = true
    
    public var children: Array<Box> = [] {
        didSet {
            guard oldValue != children else { return }
            makeDirty()
        }
    }
    
    public var useWebDefaults: Bool
    
    public init(useWebDefaults: Bool = false) {
        self.useWebDefaults = useWebDefaults
        if useWebDefaults {
            self.style = .init(useWebDefaults: true)
        }
    }
}

// MARK: - Equatable

extension Box: Equatable {
    public static func == (lhs: Box, rhs: Box) -> Bool {
        guard  // the computed layout is not concidered an equatable property
            lhs.name == rhs.name,
            lhs.style == rhs.style,
            lhs.isDirty == rhs.isDirty,
            lhs.children == rhs.children
            else { return false }
        return true
    }
}

// MARK: - Codable

extension Box: Codable {
 
    /// We do not encode the computed layout or dirty layout attributes.
    /// Any freshly decoded instances are expected to compute their layouts.
    public enum CodingKeys: String, CaseIterable, CodingKey {
        case name
        case style
        case children
        case useWebDefaults
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.style = try container.decode(FlexBox.self, forKey: .style)
        self.children = try container.decode([Box].self, forKey: .children)
        self.useWebDefaults = try container.decode(Bool.self, forKey: .useWebDefaults)
        self.isDirty = true
        self.layout = .init()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.style, forKey: .style)
        try container.encode(self.children, forKey: .children)
        try container.encode(self.useWebDefaults, forKey: .useWebDefaults)
    }
}

// MARK: - Dirty Status

extension Box {
    
    public mutating func makeDirty() {
        guard !isDirty else { return }
        self.isDirty = true
        self.layout.computedFlexBasis = nil
        self.layout.cachedLayout = nil
    }
    
    public mutating func reset() {
        self.layout = .init()
        makeDirty()
    }
}
