//
//  File.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/4/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

public enum MeasuringTap {
    case basic
}

public struct MeasureTask {
    public var node: AnyFlexNode
    public var width: Float?
    public var widthMode: MeasureMode
    public var height: Float?
    public var heightMode: MeasureMode
    
    init(
        node: AnyFlexNode,
        width: Float?,
        widthMode: MeasureMode,
        height: Float?,
        heightMode: MeasureMode)
    {
        self.node = node
        self.width = width
        self.widthMode = widthMode
        self.height = height
        self.heightMode = heightMode
    }
}

public struct BaselineTask {
    public var node: AnyFlexNode
    public var width: Float
    public var height: Float
}

public protocol FlexElement {
    static var `default`: Self { get }
}

public enum NoFlexElement: FlexElement {
    public static var `default`: NoFlexElement {
        return .none
    }
    
    case none
}

public protocol AnyFlexNode: class {
    var name: String { get }
    var hasNewLayout: Bool { get }
    var nodeType: FlexNodeType { get }
    var style: FlexBox { get }
    var layout: LayoutResult { get }
    var isReferenceBaseline: Bool { get }
}

public typealias MeasureFunc = (MeasureTask) -> Size
public typealias BaselineFunc = (BaselineTask) -> Float

public typealias DirtiedFunc = (AnyFlexNode) -> Void
public typealias PrintFunc = (AnyFlexNode) -> Void

final public class FlexNode<T: FlexElement>: AnyFlexNode {
    
    public typealias Element = T
    
    public var name: String = UUID().uuidString
    
    public var hasNewLayout: Bool = true
    
    public var nodeType: FlexNodeType = .default
    
    public var style: FlexBox = .init() {
        didSet {
            if oldValue != style {
                markDirtyAndPropogate()
            }
        }
    }
    
    public var layout: LayoutResult = .init()

    public var isReferenceBaseline: Bool = false
    
    fileprivate weak var container: FlexNode? = nil

    internal var _children: [FlexNode] = []
    
    public var children: [FlexNode] {
        get {
            return _children
        }
        
        set {
            if newValue.count == 0 {
                if _children.count > 0 {
                    _children.forEach({
                        $0.layout = LayoutResult()
                        $0.container = nil
                    })
                    _children = []
                    markDirtyAndPropogate()
                }
            } else {
                if _children.count > 0 {
                    for oldChild in _children {
                        if !newValue.contains(where: {$0 === oldChild }) {
                            oldChild.layout = LayoutResult()
                            oldChild.container = nil
                        }
                    }
                }
                _children = newValue
                _children.forEach({ $0.container = self })
                markDirtyAndPropogate()
            }
            
            _children = newValue
        }
    }
    
    public var config: Config = Config()
    public var useWebDefaults: Bool = false

    public internal(set) var isDirty: Bool = false
//    {
//        didSet {
//            if
//                isDirty,
//                oldValue != isDirty,
//                let dirtyFunc = self.dirtiedFunc
//            {
//                dirtyFunc(self)
//            }
//        }
//    }
    
    public private(set) var resolvedDimensions: Dimensions = .undefined
    
    public var element: Element
    
    public init(element: Element = .default, useWebDefaults: Bool = false) {
        self.element = element
        self.useWebDefaults = useWebDefaults
        if useWebDefaults {
            self.style = .init(useWebDefaults: true)
        }
    }
    
    public init(element: Element = .default, config: Config) {
        self.element = element
        self.config = config
    }
    
    public init(copy: FlexNode) {
        self.element = copy.element
        self.hasNewLayout = copy.hasNewLayout
        self.nodeType = copy.nodeType
        self.style = copy.style
        self.layout = copy.layout
        self.isReferenceBaseline = copy.isReferenceBaseline
        self.container = copy.container
        self._children = copy._children
        self.config = copy.config
        self.isDirty = copy.isDirty
    }
    
    // MARK: - Methods related to positions, margin, padding and border -
    
    /// The relative postion for a given axis and size.
    ///
    /// - Parameters:
    ///   - axis: the FlexDirection in question
    ///   - axisSize: the size of the axis.
    /// - Returns: If both left and right are defined, then use left. Otherwise return
    /// +left or -right depending on which is defined.
    public func relativePosition(
        axis: FlexDirection,
        axisSize: Float?
        ) -> Float?
    {
        guard
            isLeadingPositionDefined(forAxis: axis)
            else {
                guard
                    let trailingPosition = getTrailingPosition(
                        axis: axis, axisSize: axisSize)
                    else { return nil }
                return trailingPosition * -1.0
        }
        
        return getLeadingPosition(axis: axis, axisSize: axisSize)
    }
    
    public func setPosition(
        direction: Direction,
        mainSize: Float?,
        crossSize: Float?,
        ownerWidth: Float?
        ) -> Void
    {
        let directionRespectingRoot: Direction = direction
//            = hasOwner ? direction : .leftToRight
        let mainAxis = style.flexDirection.resolve(
            direction: directionRespectingRoot)
        let crossAxis = mainAxis.cross(direction: directionRespectingRoot)
        
        let relativePositionMain: Float = relativePosition(
            axis: mainAxis, axisSize: mainSize) ?? 0.0
        let relativePositionCross: Float = relativePosition(
            axis: crossAxis, axisSize: crossSize) ?? 0.0
        
        self.layout.position[mainAxis] = (getLeadingMargin(
            axis: mainAxis, widthSize: ownerWidth) + relativePositionMain)
        
        
        self.layout.position[trailing: mainAxis] = (getTrailingMargin(
            axis: mainAxis, widthSize: ownerWidth) + relativePositionMain)
        
        self.layout.position[crossAxis] = (getLeadingMargin(
            axis: crossAxis, widthSize: ownerWidth) + relativePositionCross)
        
        self.layout.position[trailing: crossAxis] = (getTrailingMargin(
            axis: crossAxis, widthSize: ownerWidth) + relativePositionCross)
        
    }
    
    public static func apply(node: FlexNode) {
        
    }
    
    public func getLeadingPosition(
        axis: FlexDirection,
        axisSize: Float?
        ) -> Float?
    {
        if axis.isRow {
            let leadingPosition: Value = style.position.compute(
                edge: .start, withDefault: .undefined)
            if leadingPosition != .undefined {
                return leadingPosition.resolve(size: axisSize)
            }
        }
        
        let leadingPostion: Value = style.position.compute(
            edge: axis.leading, withDefault: .undefined)
        
        guard leadingPostion == .undefined else {
            return leadingPostion.resolve(size: axisSize)
        }
        
        return 0.0
    }
    
    public func getTrailingPosition(
        axis: FlexDirection,
        axisSize: Float?
        ) -> Float?
    {
        if axis.isRow {
            let trailingPosition: Value = style.position.compute(
                edge: .end, withDefault: .undefined)
            if trailingPosition != .undefined {
                return trailingPosition.resolve(size: axisSize)
            }
        }
        
        let trailingPosition: Value = style.position.compute(
            edge: axis.trailing, withDefault: .undefined)
        
        guard trailingPosition == .undefined else {
            return trailingPosition.resolve(size: axisSize)
        }
        
        return nil
    }
    
    public func isLeadingPositionDefined(
        forAxis axis: FlexDirection
        ) -> Bool
    {
        if
            axis.isRow,
            style.position.compute(
                edge: .start, withDefault: .undefined) != .undefined
        {
            return true
        }
        
        return style.position.compute(
            edge: axis.leading, withDefault: .undefined) != .undefined
    }
    
    public func isTrailingPosDefined(
        forAxis axis: FlexDirection
        ) -> Bool
    {
        if
            axis.isRow,
            style.position.compute(
                edge: .end, withDefault: .undefined) != .undefined
        {
            return true
        }
        
        return style.position.compute(
            edge: axis.trailing, withDefault: .undefined) != .undefined
    }
    
    public func getLeadingMargin(
        axis: FlexDirection,
        widthSize: Float?
        ) -> Float
    {
        if axis.isRow, style.margin.start.unit != .undefined {
            return style.margin.start.resolve(size: widthSize) ?? 0.0
        }
        return style.margin.compute(
            edge: axis.leading,
            withDefault: .zero).resolve(size: widthSize) ?? 0.0
    }
    
    public func getTrailingMargin(
        axis: FlexDirection,
        widthSize: Float?
        ) -> Float
    {
        if axis.isRow, style.margin.end != .undefined {
            return style.margin.end.resolve(size: widthSize) ?? 0.0
        }
        return style.margin.compute(
            edge: axis.trailing,
            withDefault: .zero).resolve(size: widthSize) ?? 0.0
    }
    
    public func getMarginForAxis(
        axis: FlexDirection,
        widthSize: Float?
        ) -> Float
    {
        let leading = getLeadingMargin(axis: axis, widthSize:widthSize)
        let trailing = getTrailingMargin(axis: axis, widthSize: widthSize)
        return leading + trailing
    }
    
    public func getLeadingBorder(
        axis: FlexDirection
        ) -> Float
    {
        guard
            axis.isRow,
            style.border.start != .undefined,
            let value = style.border.start.value,
            value >= 0.0
            else {
                let computedEdgeValue = style.border.compute(
                    edge: axis.leading, withDefault: .zero).value
                return max(computedEdgeValue, 0.0)
        }
        return value
    }
    
    public func getTrailingBorder(
        axis: FlexDirection
        ) -> Float
    {
        guard
            axis.isRow,
            style.border.end != .undefined,
            let value = style.border.end.value,
            value >= 0.0
            else {
                let computedEdgeValue = style.border.compute(
                    edge: axis.trailing, withDefault: .zero).value
                return max(computedEdgeValue, 0.0)
        }
        return value
    }
    
    
    
    public func getLeadingPadding(
        axis: FlexDirection,
        widthSize: Float?
        ) -> Float
    {
        guard
            axis.isRow,
            style.padding.start != .undefined,
            let resolvedValue = style.padding.start.resolve(size: widthSize),
            resolvedValue >= 0.0
            else {
                let resolvedValue = style.padding.compute(
                    edge: axis.leading, withDefault: .zero)
                    .resolve(size: widthSize)
                return max(resolvedValue, 0.0)
        }
        
        return resolvedValue
    }
    
    public func getTrailingPadding(
        axis: FlexDirection,
        widthSize: Float?
        ) -> Float
    {
        guard
            axis.isRow,
            style.padding.end != .undefined,
            let resolvedValue = style.padding.end.resolve(size: widthSize),
            resolvedValue >= 0.0
            else {
                let resolvedValue = style.padding.compute(
                    edge: axis.trailing, withDefault: .zero)
                    .resolve(size: widthSize)
                return max(resolvedValue, 0.0)
        }
        return resolvedValue
        
    }
    
    public func getLeadingPaddingAndBorder(
        axis: FlexDirection,
        widthSize: Float?
        ) -> Float
    {
        let padding = getLeadingPadding(axis: axis, widthSize: widthSize)
        let border = getLeadingBorder(axis: axis)
        return padding + border
    }
    
    public func getTrailingPaddingAndBorder(
        axis: FlexDirection,
        widthSize: Float?
        ) -> Float
    {
        let padding = getTrailingPadding(axis: axis, widthSize: widthSize)
        let border = getTrailingBorder(axis: axis)
        return padding + border
    }

    public func marginLeadingValue(
        axis: FlexDirection
        ) -> Value
    {
        if axis.isRow, style.margin.start != .undefined {
            return style.margin.start
        } else {
            return style.margin[axis.leading]
        }
    }
    
    public func marginTrailingValue(
        axis: FlexDirection
        ) -> Value
    {
        if axis.isRow, style.margin.end != .undefined {
            return style.margin.end
        } else {
            return style.margin[axis.trailing]
        }
    }
    
    public func resolveFlexBasisPtr() -> Value {
        let flexBasis = style.flexBasis
        if flexBasis.value != nil {
            return flexBasis
        }
        if
            let value = style.flex,
            value > 0.0
        {
            return self.useWebDefaults ? .auto : .zero
        }
        
        return .auto
    }
    
    func resolveDimension() {
        for dim in Dimension.allCases {
            if
                style.max[dim] != .undefined,
                style.max[dim] == style.min[dim]
            {
                resolvedDimensions[dim] = style.max[dim]
            } else {
                resolvedDimensions[dim] = style.dimensions[dim]
            }
        }
    }
    
    public func resolveDirection(ownerDirection: Direction) -> Direction {
        if style.direction == .inherit {
            return ownerDirection != .inherit ? ownerDirection : .leftToRight
        } else {
            return style.direction
        }
    }

    public func cloneChildrenIfNeeded() {
        guard
            // If the first child has this node as its owner, we assume that it is
            // already unique. We can do this because if we have it has a child, that
            // means that its owner was at some point cloned which made that subtree
            // immutable. We also assume that all its sibling are cloned as well.
            let first = _children.first,
            first.container !== self
            else { return }
        
        let childCount = _children.count
        for i in 0..<childCount {
            let oldChild = _children[i]
            let newChild = FlexNode(copy: oldChild)
            replaceChild(at: i, with: newChild)
            newChild.container = self
        }
        
    }
    
    public func markDirtyAndPropogate() {
        guard !isDirty else { return }
        isDirty = true
        layout.computedFlexBasis = nil
        layout.cachedLayout = nil
        if let owner = self.container {
            owner.markDirtyAndPropogate()
        }
    }
    
    public func markDirtyAndPropogateDownwards() {
        isDirty = true
        children.forEach({ $0.markDirtyAndPropogateDownwards() })
    }
    
    public func resolveFlexGrow() -> Float {
//        guard
//            container != nil
//            else { return 0.0 }
        guard
            let flexGrow = style.flexGrow
            else {
                guard
                    let flex = style.flex,
                    flex > 0.0
                    else { return 0.0 }
                return flex
        }
        
        return flexGrow
    }
    
    public func resolveFlexShrink() -> Float {
//        guard
//            container != nil
//            else { return 0.0 }
        guard
            let flexShrink = style.flexShrink
            else {
                guard
                    !self.useWebDefaults,
                    let flex = style.flex,
                    flex < 0.0
                    else {
                        if self.useWebDefaults {
                            return FlexBox.webDefaultFlexShrink
                        } else {
                            return FlexBox.defaultFlexShrink
                        }
                }
                return -flex
        }

        return flexShrink
    }

    public var isNodeFlexible: Bool {
        return (
            (style.positionType == .relative) &&
                (resolveFlexGrow() != 0.0 || resolveFlexShrink() != 0.0))
    }
    
    public func isLayoutTreeEqualToNode(
        node: FlexNode
        ) -> Bool
    {
        guard
            children.count == node.children.count,
            layout == node.layout,
            children.count != 0
            else { return false}
        
        for pair in zip(children, node.children) {
            guard
                pair.0.isLayoutTreeEqualToNode(node: pair.1)
                else { return false }
        }
        return true
    }
    
}

extension FlexNode {
    
    public func clearChildren() {
        removeAllChildren()
    }
    
    @discardableResult
    public func remove(
        child: FlexNode
        ) -> FlexNode?
    {
        guard
            let index = _children.firstIndex(where: { $0 === child })
            else { return nil }
        child.layout = LayoutResult()
        child.container = nil
        markDirtyAndPropogate()
        return _children.remove(at: index)
    }
    
    @discardableResult
    public func removeChild(
        at index: Int
        ) -> FlexNode?
    {
        guard
            index < _children.count
            else { return nil }
        let child = _children.remove(at: index)
        child.layout = LayoutResult()
        child.container = nil
        markDirtyAndPropogate()
        return child
    }
    
    public func removeAllChildren() {
        _children.forEach({
            $0.layout = LayoutResult()
            $0.container = nil
        })
        _children = []
        markDirtyAndPropogate()
    }
    
    public func replace(child: FlexNode, with other: FlexNode) {
        guard
            let index = _children.firstIndex(where: { $0 === child })
            else { return }
        replaceChild(at: index, with: other)
    }
    
    public func replaceChild(at index: Int, with other: FlexNode) {
        guard
            index < _children.count
            else { return }
        let old = _children[index]
        _children[index] = other
        old.layout = LayoutResult()
        old.container = nil
        other.layout = LayoutResult()
        other.container = self
        markDirtyAndPropogate()
    }
    
    public func insert(child: FlexNode, at index: Int) {
        if let oldOwner = child.container {
            oldOwner.remove(child: child)
        }
        let newIndex = index <= _children.count ? index : _children.count
        _children.insert(child, at: newIndex)
        child.layout = LayoutResult()
        child.container = self
        markDirtyAndPropogate()
    }
    
    public func add(child: FlexNode) {
        if let oldOwner = child.container {
            oldOwner.remove(child: child)
        }
        _children.append(child)
        child.layout = LayoutResult()
        child.container = self
        markDirtyAndPropogate()
    }
    
}

// MARK: - Layout Calculation -

extension FlexNode {
    public func calculateLayout(
        width ownerWidth: Float?,
        height ownerHeight: Float?,
        direction ownerDirection: Direction,
        processingContext context: ProcessingContext = ProcessingContext()
        ) -> Void
    {
        context.reset()
        
        resolveDimension()
        
        var width: Float? = nil
        var widthMeasureMode: MeasureMode = .undefined
        
        if
            isStyleDimDefined(for: .row, ownerSize: ownerWidth)
        {
            width = resolvedDimensions[FlexDirection.row.dimension].resolve(
                size: ownerWidth) + getMarginForAxis(
                    axis: .row, widthSize: ownerWidth)
            widthMeasureMode = .exactly
        } else if
            let resolvedWidth = style.max[.width].resolve(
                size: ownerWidth)
        {
            width = resolvedWidth
            widthMeasureMode = .atMost
        } else {
            width = ownerWidth
            widthMeasureMode = width == nil ? .undefined : .exactly
        }
        
        var height: Float?
        var heightMeasureMode: MeasureMode = .undefined
        
        if
            isStyleDimDefined(for: .column, ownerSize: ownerHeight)
        {
            height = resolvedDimensions[FlexDirection.column.dimension].resolve(
                size: ownerHeight) + getMarginForAxis(
                    axis: .column, widthSize: ownerWidth)
            heightMeasureMode = .exactly
        } else if
            let resolvedHeight = style.max[.height].resolve(
                size: ownerHeight)
        {
            height = resolvedHeight
            heightMeasureMode = .atMost
        } else {
            height = ownerHeight
            heightMeasureMode = height == nil ? .undefined : .exactly
        }
        
        guard
            performLayoutIfNeeded(
                availableWidth: width,
                availableHeight: height,
                widthMeasureMode: widthMeasureMode,
                heightMeasureMode: heightMeasureMode,
                ownerWidth: ownerWidth,
                ownerHeight: ownerHeight,
                ownerDirection: ownerDirection,
                shouldPerformFullLayout: true,
                reason: "initial",
                config: config,
                context: context)
            else { return }
        
        setPosition(
            direction: .leftToRight,// layout.direction, // override root
            mainSize: ownerWidth,
            crossSize: ownerHeight,
            ownerWidth: ownerWidth)
        
        roundToPixelGrid(
            pointScaleFactor: config.pointScaleFactor,
            absoluteLeft: 0.0,
            absoluteTop: 0.0)
        
//        if config.printTree {
//            print(self)
//        }
        
    }
    
    func isStyleDimDefined(
        for axis: FlexDirection,
        ownerSize: Float?
        ) -> Bool
    {
        let dimension = axis.dimension
        let resolvedDimension = self.resolvedDimensions[dimension]
        
        switch resolvedDimension {
        case .undefined:
            return false
        case .point(let value):
            return value >= 0.0
        case .percent(let value):
            guard ownerSize != nil else { return false }
            return value >= 0.0
        case .auto:
            return false
        }
    }
    
    internal func roundToPixelGrid(
        pointScaleFactor: Float,
        absoluteLeft: Float,
        absoluteTop: Float
        ) -> Void
    {
        guard pointScaleFactor != 0.0 else { return }
        
        let nodeLeft = layout.position.left
        let nodeTop = layout.position.top
        
        let nodeWidth = layout.dimensions.width
        let nodeHeight = layout.dimensions.height
        
        let absoluteNodeLeft = absoluteLeft + nodeLeft
        let absoluteNodeTop = absoluteTop + nodeTop
        
        let absoluteNodeRight = absoluteNodeLeft + nodeWidth
        let absoluteNodeBottom = absoluteNodeTop + nodeHeight
        
        // If a node has a custom measure function we never want to round down its
        // size as this could lead to unwanted text truncation.
        let textRounding = nodeType == .text
        
        layout.position.left = roundValueToPixelGrid(
            value: nodeLeft,
            pointScaleFactor: pointScaleFactor,
            forceCeil: false,
            forceFloor: textRounding)
        
        layout.position.top = roundValueToPixelGrid(
            value: nodeTop,
            pointScaleFactor: pointScaleFactor,
            forceCeil: false,
            forceFloor: textRounding)
        
        // We multiply dimension by scale factor and if the result is close to the
        // whole number, we don't have any fraction To verify if the result is close
        // to whole number we want to check both floor and ceil numbers
        let hasFractionalWidth: Bool =
            !(fmodf(nodeWidth * pointScaleFactor, 1.0) ~= 0) &&
            !(fmodf(nodeWidth * pointScaleFactor, 1.0) ~= 1.0)
        let hasFractionalHeight: Bool =
            !(fmodf(nodeHeight * pointScaleFactor, 1.0) ~= 0) &&
            !(fmodf(nodeHeight * pointScaleFactor, 1.0) ~= 1.0)
        
        let roundedAbsoluteRight = roundValueToPixelGrid(
            value: absoluteNodeRight,
            pointScaleFactor: pointScaleFactor,
            forceCeil: textRounding && hasFractionalWidth,
            forceFloor: textRounding && !hasFractionalWidth)
        let roundedAbsoluteLeft = roundValueToPixelGrid(
            value: absoluteNodeLeft,
            pointScaleFactor: pointScaleFactor,
            forceCeil: false,
            forceFloor: textRounding)
        let width = roundedAbsoluteRight - roundedAbsoluteLeft
        layout.dimensions.width = width
        
        let roundedAbsoluteBottom = roundValueToPixelGrid(
            value: absoluteNodeBottom,
            pointScaleFactor: pointScaleFactor,
            forceCeil: textRounding && hasFractionalHeight,
            forceFloor: textRounding && !hasFractionalHeight)
        let roundedAbsoluteTop = roundValueToPixelGrid(
            value: absoluteNodeTop,
            pointScaleFactor: pointScaleFactor,
            forceCeil: false,
            forceFloor: textRounding)
        let height = roundedAbsoluteBottom - roundedAbsoluteTop
        layout.dimensions.height = height

        for child in _children {
            child.roundToPixelGrid(
                pointScaleFactor: pointScaleFactor,
                absoluteLeft: absoluteNodeLeft,
                absoluteTop: absoluteNodeTop)
        }
        
    }
}

func roundValueToPixelGrid(
    value: Float,
    pointScaleFactor: Float,
    forceCeil: Bool = false,
    forceFloor: Bool = false
    ) -> Float
{
    guard pointScaleFactor != 0.0 else {
        return value
    }
    
//    guard
//        !pointScaleFactor.isNaN,
//        pointScaleFactor != .infinity,
//        pointScaleFactor != -.infinity
//        else { return 0.0 }

    var scaledValue = value * pointScaleFactor
    // We want to calculate `fractial` such that
    // `floor(scaledValue) = scaledValue - fractial`.
    var fractial = fmodf(scaledValue, 1.0)
    if fractial < 0.0 {
        // This branch is for handling negative numbers for `value`.
        //
        // Regarding `floor` and `ceil`. Note that for a number x, `floor(x) <= x <=
        // ceil(x)` even for negative numbers. Here are a couple of examples:
        //   - x =  2.2: floor( 2.2) =  2, ceil( 2.2) =  3
        //   - x = -2.2: floor(-2.2) = -3, ceil(-2.2) = -2
        //
        // Regarding `fmodf`. For fractional negative numbers, `fmodf` returns a
        // negative number. For example, `fmodf(-2.2) = -0.2`. However, we want
        // `fractial` to be the number such that subtracting it from `value` will
        // give us `floor(value)`. In the case of negative numbers, adding 1 to
        // `fmodf(value)` gives us this. Let's continue the example from above:
        //   - fractial = fmodf(-2.2) = -0.2
        //   - Add 1 to the fraction: fractial2 = fractial + 1 = -0.2 + 1 = 0.8
        //   - Finding the `floor`: -2.2 - fractial2 = -2.2 - 0.8 = -3
        fractial += 1.0
    }
    
    if fractial ~= 0.0 {
        // First we check if the value is already rounded
        scaledValue = scaledValue - fractial
    } else if fractial ~= 1.0 {
        scaledValue = scaledValue - fractial + 1.0
    } else if forceCeil {
        // Next we check if we need to use forced rounding
        scaledValue = scaledValue - fractial + 1.0
    } else if forceFloor {
        scaledValue = scaledValue - fractial
    } else {
        let offset: Float = (fractial > 0.5 || fractial ~= 0.5) ? 1.0 : 0.0
        scaledValue = scaledValue - fractial + offset
    }
    
    return scaledValue / pointScaleFactor
}

extension Float {
    static func ~=(lhs: Float, rhs: Float) -> Bool {
        return abs(lhs - rhs) < 0.0001
    }
}
