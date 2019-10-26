//
//  Flex.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/4/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

public struct FlexBox: Equatable {
    
    public static let `default`: FlexBox = .init()
    
    public static let defaultFlexShrink: Float = 0.0
    public static let webDefaultFlexShrink: Float = 1.0
    
    public var direction: Direction = .inherit
    public var flexDirection: FlexDirection = .column
    public var justifyContent: Justify = .flexStart
    public var alignContent: Align = .flexStart
    public var alignItems: Align = .stretch
    public var alignSelf: Align = .auto
    public var positionType: Position = .relative
    public var flexWrap: Wrap = .noWrap
    public var overflow: Overflow = .visible
    public var display: Display = .flex
    public var flex: Float? = nil
    public var flexGrow: Float? = nil
    public var flexShrink: Float? = FlexBox.defaultFlexShrink
    public var flexBasis: Value = .auto
    public var margin: Edges = .init()
    public var position: Edges = .init()
    public var padding: Edges = .init()
    public var border: Edges = .init()
    public var dimensions: Dimensions = .init(.auto, .auto)
    public var min: Dimensions = .init(.undefined, .undefined)
    public var max: Dimensions = .init(.undefined, .undefined)
    public var aspectRatio: Float? = nil
    
    public init(useWebDefaults: Bool = false) {
        if useWebDefaults {
            self.flexDirection = .row
            self.alignContent = .stretch
            self.flexShrink = FlexBox.webDefaultFlexShrink
        }
    }
}

extension FlexBox {
    public var width: Value {
        get { return dimensions.width }
        set { dimensions.width = newValue }
    }
    public var height: Value {
        get { return dimensions.height }
        set { dimensions.height = newValue }
    }
}

extension FlexBox {
    public enum Properties {
        case direction(Direction)
        case flexDirection(FlexDirection)
        case justifyContent(Justify)
        case alignContent(Align)
        case alignItems(Align)
        case alignSelf(Align)
        case positionType(Position)
        case flexWrap(Wrap)
        case overflow(Overflow)
        case display(Display)
        case flex(Float?)
        case flexGrow(Float?)
        case flexShrink(Float?)
        case flexBasis(Value)
        case margin(Edges)
        case position(Edges)
        case padding(Edges)
        case border(Edges)
        case dimensions(Dimensions)
        case min(Dimensions)
        case max(Dimensions)
        case aspectRatio(Float?)
    }
    
    public init(_ properties: [Properties]) {
        for property in properties {
            switch property {
            case .direction(let value): self.direction = value
            case .flexDirection(let value): self.flexDirection = value
            case .justifyContent(let value): self.justifyContent = value
            case .alignContent(let value): self.alignContent = value
            case .alignItems(let value): self.alignItems = value
            case .alignSelf(let value): self.alignSelf = value
            case .positionType(let value): self.positionType = value
            case .flexWrap(let value): self.flexWrap = value
            case .overflow(let value): self.overflow = value
            case .display(let value): self.display = value
            case .flex(let value): self.flex = value
            case .flexGrow(let value): self.flexGrow = value
            case .flexShrink(let value): self.flexShrink = value
            case .flexBasis(let value): self.flexBasis = value
            case .margin(let value): self.margin = value
            case .position(let value): self.position = value
            case .padding(let value): self.padding = value
            case .border(let value): self.border = value
            case .dimensions(let value): self.dimensions = value
            case .min(let value): self.min = value
            case .max(let value): self.max = value
            case .aspectRatio(let value): self.aspectRatio = value
            }
        }
    }
    
    public static func flexBox(_ properties: [Properties]) -> FlexBox {
        return FlexBox(properties)
    }
    
}

extension FlexBox: Codable {
    enum CodingKeys: String, CodingKey {
        case direction
        case flexDirection
        case justifyContent
        case alignContent
        case alignItems
        case alignSelf
        case positionType
        case flexWrap
        case overflow
        case display
        case flex
        case flexGrow
        case flexShrink
        case flexBasis
        case margin
        case position
        case padding
        case border
        case dimensions
        case min
        case max
        case aspectRatio
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let direction = try? container.decode(Direction.self, forKey: .direction) {
            self.direction = direction
        }
        
        if let flexDirection = try? container.decode(FlexDirection.self, forKey: .flexDirection) {
            self.flexDirection = flexDirection
        }
        
        if let justifyContent = try? container.decode(Justify.self, forKey: .justifyContent) {
            self.justifyContent = justifyContent
        }
        
        if let alignContent = try? container.decode(Align.self, forKey: .alignContent) {
            self.alignContent = alignContent
        }
        
        if let alignItems = try? container.decode(Align.self, forKey: .alignItems) {
            self.alignItems = alignItems
        }
        
        if let alignSelf = try? container.decode(Align.self, forKey: .alignSelf) {
            self.alignSelf = alignSelf
        }
        
        if let positionType = try? container.decode(Position.self, forKey: .positionType) {
            self.positionType = positionType
        }
        
        if let flexWrap = try? container.decode(Wrap.self, forKey: .flexWrap) {
            self.flexWrap = flexWrap
        }
        
        if let overflow = try? container.decode(Overflow.self, forKey: .overflow) {
            self.overflow = overflow
        }
        
        if let display = try? container.decode(Display.self, forKey: .display) {
            self.display = display
        }
        
        if let flex = try? container.decode(Float.self, forKey: .flex) {
            self.flex = flex
        }
        
        if let flexGrow = try? container.decode(Float.self, forKey: .flexGrow) {
            self.flexGrow = flexGrow
        }
        
        if let flexShrink = try? container.decode(Float.self, forKey: .flexShrink) {
            self.flexShrink = flexShrink
        }
        
        if let flexBasis = try? container.decode(Value.self, forKey: .flexBasis) {
            self.flexBasis = flexBasis
        }
        
        if let margin = try? container.decode(Edges.self, forKey: .margin) {
            self.margin = margin
        }
        
        if let position = try? container.decode(Edges.self, forKey: .position) {
            self.position = position
        }
        
        if let padding = try? container.decode(Edges.self, forKey: .padding) {
            self.padding = padding
        }
        
        if let border = try? container.decode(Edges.self, forKey: .border) {
            self.border = border
        }
        
        if let dimensions = try? container.decode(Dimensions.self, forKey: .dimensions) {
            self.dimensions = dimensions
        }
        
        if let min = try? container.decode(Dimensions.self, forKey: .min) {
            self.min = min
        }
        
        if let max = try? container.decode(Dimensions.self, forKey: .max) {
            self.max = max
        }
        
        if let aspectRatio = try? container.decode(Float.self, forKey: .aspectRatio) {
            self.aspectRatio = aspectRatio
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if direction != FlexBox.default.direction {
            try container.encode(direction, forKey: .direction)
        }
        
        if flexDirection != FlexBox.default.flexDirection {
            try container.encode(flexDirection, forKey: .flexDirection)
        }
        
        if justifyContent != FlexBox.default.justifyContent {
            try container.encode(justifyContent, forKey: .justifyContent)
        }
        
        if alignContent != FlexBox.default.alignContent {
            try container.encode(alignContent, forKey: .alignContent)
        }
        
        if alignItems != FlexBox.default.alignItems {
            try container.encode(alignItems, forKey: .alignItems)
        }
        
        if alignSelf != FlexBox.default.alignSelf {
            try container.encode(alignSelf, forKey: .alignSelf)
        }
        
        if positionType != FlexBox.default.positionType {
            try container.encode(positionType, forKey: .positionType)
        }
        
        if flexWrap != FlexBox.default.flexWrap {
            try container.encode(flexWrap, forKey: .flexWrap)
        }
        
        if overflow != FlexBox.default.overflow {
            try container.encode(overflow, forKey: .overflow)
        }
        
        if display != FlexBox.default.display {
            try container.encode(display, forKey: .display)
        }
        
        if flex != FlexBox.default.flex {
            try container.encode(flex, forKey: .flex)
        }
        
        if flexGrow != FlexBox.default.flexGrow {
            try container.encode(flexGrow, forKey: .flexGrow)
        }
        
        if flexShrink != FlexBox.default.flexShrink {
            try container.encode(flexShrink, forKey: .flexShrink)
        }
        
        if flexBasis != FlexBox.default.flexBasis {
            try container.encode(flexBasis, forKey: .flexBasis)
        }
        
        if margin != FlexBox.default.margin {
            try container.encode(margin, forKey: .margin)
        }
        
        if position != FlexBox.default.position {
            try container.encode(position, forKey: .position)
        }
        
        if padding != FlexBox.default.padding {
            try container.encode(padding, forKey: .padding)
        }
        
        if border != FlexBox.default.border {
            try container.encode(border, forKey: .border)
        }
        
        if dimensions != FlexBox.default.dimensions {
            try container.encode(dimensions, forKey: .dimensions)
        }
        
        if min != FlexBox.default.min {
            try container.encode(min, forKey: .min)
        }
        
        if max != FlexBox.default.max {
            try container.encode(max, forKey: .max)
        }
        
        if aspectRatio != FlexBox.default.aspectRatio {
            try container.encode(aspectRatio, forKey: .aspectRatio)
        }
    }

}
