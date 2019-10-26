//
//  Node-Layout.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/6/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

extension FlexNode {
    public enum LayoutError: String, Error {
        case unknownLayoutError
    }
}

extension FlexNode {
    
//    #warning("maybe not good to have a static gDepth property")
//    internal static var gDepth: Int = 0
//    #warning("maybe not good to have a static gCurrentGenerationCount property")
//    internal static var gCurrentGenerationCount: Int = 0
//    #warning("gPrintChanges")
//    internal static var gPrintChanges: Bool = false
//    internal static var gPrintSkips: Bool = false

    /// Determine whether the results are already cached. We maintain a
    /// separate cache for layouts and measurements. A layout operation
    /// modifies the positions and dimensions for nodes in the subtree.
    /// The algorithm assumes that each node gets layed out a maximum of one
    /// time per tree layout, but multiple measurements may be required to
    /// resolve all of the flex dimensions. We handle nodes with measure
    /// functions specially here because they are the most expensive to
    /// measure, so it's worth avoiding redundant measurements if at all
    /// possible.
    ///
    /// - Parameters:
    ///   - availableWidth: Available width to be used for sizing the node.
    ///   - availableHeight: Available height to be used for sizing the node.
    ///   - widthMeasureMode: Indicates the sizing rules for the width.
    ///   - heightMeasureMode: Indicates the sizing rules for the height
    ///   - ownerWidth: The width of the parent node.
    ///   - ownerHeight: The height of the parent node.
    ///   - ownerDirection: The inline (text) direction within the owner
    ///     (leftToRight or rightToLeft)
    ///   - shouldPerformFullLayout: Specifies whether the caller is interested
    ///     in just the dimensions of the node or it requires the entire node
    ///     and it's subtree to be layed out (with final positions)
    ///   - reason: ??
    ///   - config: The config used for layout. Most likely global config.
    @discardableResult internal func performLayoutIfNeeded(
        availableWidth: Float?,
        availableHeight: Float?,
        widthMeasureMode: MeasureMode,
        heightMeasureMode: MeasureMode,
        ownerWidth: Float?,
        ownerHeight: Float?,
        ownerDirection: Direction,
        shouldPerformFullLayout: Bool,
        reason: String,
        config: Config,
        context: ProcessingContext
        ) -> Bool
    {
        context.gDepth += 1
        
        let needToVisitNode: Bool =
            (isDirty && layout.generationCount != context.gCurrentGenerationCount)
                || layout.lastOwnerDirection != ownerDirection
        
        if needToVisitNode {
            layout.nextCachedMeasurementsIndex = 0
            layout.cachedLayout = nil
        }
        
        var cachedResults: CachedMeasurement? = nil
        
        // Determine whether the results are already cached. We maintain a
        // separate cache for layouts and measurements. A layout operation
        // modifies the positions and dimensions for nodes in the subtree.
        // The algorithm assumes that each node gets layed out a maximum of
        // one time per tree layout, but multiple measurements may be required
        // to resolve all of the flex dimensions. We handle nodes with measure
        // functions specially here because they are the most expensive to
        // measure, so it's worth avoiding redundant measurements if at
        // all possible.
        if
            _children.count == 0,
            let _: MeasuringHelper = context[self.nodeType]
//            context
//            self.measureFunc != nil
        {
            let marginAxisRow = getMarginForAxis(
                axis: .row, widthSize: ownerWidth)
            let marginAxisColumn = getMarginForAxis(
                axis: .column, widthSize: ownerWidth)
            
            // First, try to use the layout cache.
            if canUseCachedMeasurement(
                    widthMode: widthMeasureMode,
                    availableWidth: availableWidth,
                    heightMode: heightMeasureMode,
                    availableHeight: availableHeight,
                    cachedMeasurement: layout.cachedLayout,
                    marginRow: marginAxisRow,
                    marginColumn: marginAxisColumn,
                    config: config)
            {
                cachedResults = layout.cachedLayout
            } else {
                for measurements in self.layout.cachedMeasurements {
                    if canUseCachedMeasurement(
                        widthMode: widthMeasureMode,
                        availableWidth: availableWidth,
                        heightMode: heightMeasureMode,
                        availableHeight: availableHeight,
                        cachedMeasurement: measurements,
                        marginRow: marginAxisRow,
                        marginColumn: marginAxisColumn,
                        config: config)
                    {
                        cachedResults = measurements
                        break
                    }
                }
            }
        } else if shouldPerformFullLayout {
            
            if
                availableWidth ~= layout.cachedLayout?.availableWidth,
                availableHeight ~= layout.cachedLayout?.availableHeight,
                widthMeasureMode == layout.cachedLayout?.widthMeasureMode,
                heightMeasureMode == layout.cachedLayout?.heightMeasureMode
            {
                cachedResults = layout.cachedLayout
            }
        } else {
            for measurements in self.layout.cachedMeasurements {
                if
                    availableWidth ~= measurements.availableWidth,
                    availableHeight ~= measurements.availableHeight,
                    widthMeasureMode == measurements.widthMeasureMode,
                    heightMeasureMode == measurements.heightMeasureMode
                {
                    cachedResults = measurements
                    break
                }
            }
        }
        
        if
            !needToVisitNode,
            let results = cachedResults
        {
            layout.measuredDimensions.width = results.computedWidth
            layout.measuredDimensions.height = results.computedHeight

            // TODO:
            if context.gPrintChanges && context.gPrintSkips {
                // TODO:
            }
        } else {
            if context.gPrintChanges {
                // TODO:
            }
            performLayout(
                availableWidth: availableWidth,
                availableHeight: availableHeight,
                widthMeasureMode: widthMeasureMode,
                heightMeasureMode: heightMeasureMode,
                ownerDirection: ownerDirection,
                ownerWidth: ownerWidth,
                ownerHeight: ownerHeight,
                shouldPerformFullLayout: shouldPerformFullLayout,
                config: config,
                context: context)
            
            if context.gPrintChanges {
                // TODO:
            }
            
            layout.lastOwnerDirection = ownerDirection
            
            if cachedResults == nil {
                
                if layout.cachedMeasurements.count == LayoutResult.maxCachedResultCount {
                    if context.gPrintChanges {
                        print("Out of cache entries")
                    }
                    layout.cachedMeasurements.remove(at: 0)
                }
                
                
                if shouldPerformFullLayout {
//                    let newCacheEntry: CachedMeasurement?
//                    newCacheEntry = layout.cachedLayout
//                    newCacheEntry?.availableWidth = availableWidth
//                    newCacheEntry?.availableHeight = availableHeight
//                    newCacheEntry?.widthMeasureMode = widthMeasureMode
//                    newCacheEntry?.heightMeasureMode = heightMeasureMode
//                    newCacheEntry?.computedWidth =
//                        layout.measuredDimensions.width
//                    newCacheEntry?.computedHeight =
//                        layout.measuredDimensions.height
                    
                    let newCacheEntry: CachedMeasurement = CachedMeasurement.init(
                        availableWidth: availableWidth,
                        availableHeight: availableHeight,
                        widthMeasureMode: widthMeasureMode,
                        heightMeasureMode: heightMeasureMode,
                        computedWidth: self.layout.measuredDimensions.width,
                        computedHeight: self.layout.measuredDimensions.height)
                    
                    self.layout.cachedLayout = newCacheEntry
                    self.layout.cachedMeasurements.append(newCacheEntry)

                } else {
//                    let newCacheEntry: CachedMeasurement?
//                    newCacheEntry = layout.cachedMeasurements.last
//                    newCacheEntry?.availableWidth = availableWidth
//                    newCacheEntry?.availableHeight = availableHeight
//                    newCacheEntry?.widthMeasureMode = widthMeasureMode
//                    newCacheEntry?.heightMeasureMode = heightMeasureMode
//                    newCacheEntry?.computedWidth =
//                        layout.measuredDimensions.width
//                    newCacheEntry?.computedHeight =
//                        layout.measuredDimensions.height
                    
                    let newCacheEntry: CachedMeasurement = CachedMeasurement.init(
                        availableWidth: availableWidth,
                        availableHeight: availableHeight,
                        widthMeasureMode: widthMeasureMode,
                        heightMeasureMode: heightMeasureMode,
                        computedWidth: self.layout.measuredDimensions.width,
                        computedHeight: self.layout.measuredDimensions.height)
                    
//                    self.layout.cachedLayout = newCacheEntry
                    self.layout.cachedMeasurements.append(newCacheEntry)

                }
                
//                let newCacheEntry: CachedMeasurement = CachedMeasurement.init(
//                    availableWidth: availableWidth,
//                    availableHeight: availableHeight,
//                    widthMeasureMode: widthMeasureMode,
//                    heightMeasureMode: heightMeasureMode,
//                    computedWidth: self.layout.measuredDimensions.width,
//                    computedHeight: self.layout.measuredDimensions.height)
//
//                self.layout.cachedLayout = newCacheEntry
//                self.layout.cachedMeasurements.append(newCacheEntry)
                
            }
        }
        
        if shouldPerformFullLayout {
            self.layout.dimensions.width = layout.measuredDimensions.width
            self.layout.dimensions.height = layout.measuredDimensions.height
            self.hasNewLayout = true
            self.isDirty = false
        }
        
        context.gDepth -= 1
        self.layout.generationCount = context.gCurrentGenerationCount
        return (needToVisitNode || cachedResults == nil)
    }
    
    ///
    /// This is the main routine that implements a subset of the flexbox
    /// layout algorithm described in the W3C YG documentation:
    /// https://www.w3.org/TR/YG3-flexbox/.
    ///
    /// - Limitations of this algorithm, compared to the full standard:
    ///    - Display property is always assumed to be 'flex' except for Text
    ///    nodes, which are assumed to be 'inline-flex'.
    ///    - The 'zIndex' property (or any form of z ordering) is not
    ///    supported. Nodes are stacked in document order.
    ///    - The 'order' property is not supported. The order of flex items
    ///    is always defined by document order.
    ///    - The 'visibility' property is always assumed to be 'visible'.
    ///    Values of 'collapse' and 'hidden' are not supported.
    ///    - There is no support for forced breaks.
    ///    - It does not support vertical inline directions (top-to-bottom or
    ///    bottom-to-top text).
    ///
    /// - Deviations from standard:
    ///    - Section 4.5 of the spec indicates that all flex items have a
    ///    default minimum main size. For text blocks, for example, this is
    ///    the width of the widest word. Calculating the minimum width is
    ///    expensive, so we forego it and assume a default minimum main
    ///    size of 0.
    ///    - Min/Max sizes in the main axis are not honored when resolving
    ///    flexible lengths.
    ///    - The spec indicates that the default value for 'flexDirection'
    ///    is 'row', but the algorithm below assumes a default of 'column'.
    ///
    /// - Details:
    ///    This routine is called recursively to lay out subtrees of flexbox
    ///    elements. It uses the information in node.style, which is treated
    ///    as a read-only input. It is responsible for setting the
    ///    layout.direction and layout.measuredDimensions fields for the
    ///    input node as well as the layout.position and layout.lineIndex
    ///    fields for its child nodes. The layout.measuredDimensions field
    ///    includes any border or padding for the node but does not include
    ///    margins.
    ///
    ///    The spec describes four different layout modes: "fill available",
    ///    "max content", "min content", and "fit content". Of these, we don't
    ///    use "min content" because we don't support default minimum main
    ///    sizes (see above for details). Each of our measure modes maps
    ///    to a layout mode from the
    ///    spec (https://www.w3.org/TR/YG3-sizing/#terms):
    ///      - YGMeasureModeUndefined: max content
    ///      - YGMeasureModeExactly: fill available
    ///      - YGMeasureModeAtMost: fit content
    ///
    ///    When calling YGNodelayoutImpl and YGLayoutNodeInternal, if the
    ///    caller passes an available size of undefined then it must also
    ///    pass a measure mode of YGMeasureModeUndefined in that dimension.
    ///
    /// - Parameters:
    ///   - availableWidth: Available width to be used for sizing the node.
    ///   - availableHeight: Available height to be used for sizing the node.
    ///   - widthMeasureMode: Indicates the sizing rules for the width.
    ///   - heightMeasureMode: Indicates the sizing rules for the height
    ///   - ownerDirection: The inline (text) direction within the owner
    ///     (leftToRight or rightToLeft)
    ///   - ownerWidth: The width of the parent node.
    ///   - ownerHeight: The height of the parent node.
    ///   - shouldPerformFullLayout: Specifies whether the caller is interested in
    ///     just the dimensions of the node or it requires the entire node
    ///     and it's subtree to be layed out (with final positions)
    ///   - reason: ??
    ///   - config: The config used for layout. Most likely global config.
    ///
    internal func performLayout(
        availableWidth: Float?,
        availableHeight: Float?,
        widthMeasureMode: MeasureMode,
        heightMeasureMode: MeasureMode,
        ownerDirection: Direction,
        ownerWidth: Float?,
        ownerHeight: Float?,
        shouldPerformFullLayout: Bool,
        config: Config,
        context: ProcessingContext
        ) -> Void
    {
        // Set the resolved resolution in the node's layout.
        
        // Direction
        let direction: Direction = resolveDirection(
            ownerDirection: ownerDirection)
        self.layout.direction = direction
        
        let flexRowDirection = FlexDirection.row.resolve(
            direction: direction)
        let flexColumnDirection = FlexDirection.column.resolve(
            direction: direction)
        
        // Margin
        self.layout.margin.start = getLeadingMargin(
            axis: flexRowDirection, widthSize: ownerWidth)
        self.layout.margin.end = getTrailingMargin(
            axis: flexRowDirection, widthSize: ownerWidth)
        self.layout.margin.top = getLeadingMargin(
            axis: flexColumnDirection, widthSize: ownerWidth)
        self.layout.margin.bottom = getTrailingMargin(
            axis: flexColumnDirection, widthSize: ownerWidth)
        
        // Border
        self.layout.border.start = getLeadingBorder(axis: flexRowDirection)
        self.layout.border.end = getTrailingBorder(axis: flexRowDirection)
        self.layout.border.top = getLeadingBorder(axis: flexColumnDirection)
        self.layout.border.bottom = getTrailingBorder(axis: flexColumnDirection)

        // Padding
        self.layout.padding.start = getLeadingPadding(
            axis: flexRowDirection, widthSize: ownerWidth)
        self.layout.padding.end = getTrailingPadding(
            axis: flexRowDirection, widthSize: ownerWidth)
        self.layout.padding.top = getLeadingPadding(
            axis: flexColumnDirection, widthSize: ownerWidth)
        self.layout.padding.bottom = getTrailingPadding(
            axis: flexColumnDirection, widthSize: ownerWidth)
        
        if let measureHelper: MeasuringHelper = context[self.nodeType] {
            measureDimensions(
                availableWidth: availableWidth,
                availableHeight: availableHeight,
                widthMeasureMode: widthMeasureMode,
                heightMeasureMode: heightMeasureMode,
                ownerWidth: ownerWidth,
                ownerHeight: ownerHeight,
                measureFunc: measureHelper.measure)
            return
        }
        
        if _children.count == 0 {
            emptyContainerSetMeasuredDimensions(
                availableWidth: availableWidth,
                availableHeight: availableHeight,
                widthMeasureMode: widthMeasureMode,
                heightMeasureMode: heightMeasureMode,
                ownerWidth: ownerWidth,
                ownerHeight: ownerHeight)
            return
        }
        
        if
            !shouldPerformFullLayout,
            fixedSizeSetMeasuredDimensions(
                availableWidth: availableWidth,
                availableHeight: availableHeight,
                widthMeasureMode: widthMeasureMode,
                heightMeasureMode: heightMeasureMode,
                ownerWidth: ownerWidth,
                ownerHeight: ownerHeight)
        {
            return
        }
        
        // At this point we know we're going to perform work. Ensure that each child
        // has a mutable copy.
        self.cloneChildrenIfNeeded()
        
        // Reset layout flags, as they could have changed.
        self.layout.hasOverflow = false
        
        // STEP 1: CALCULATE VALUES FOR REMAINDER OF ALGORITHM
        let mainAxis: FlexDirection = self.style.flexDirection.resolve(
            direction: direction)
        let crossAxis: FlexDirection = mainAxis.cross(direction: direction)
        let isMainAxisRow: Bool = mainAxis.isRow
        let isNodeFlexWrap: Bool = self.style.flexWrap != .noWrap
        
        let mainAxisOwnerSize: Float?
        let crossAxisownerSize: Float?
        var measureModeMainDimension: MeasureMode
        var measureModeCrossDimension: MeasureMode
        
        if isMainAxisRow {
            mainAxisOwnerSize = ownerWidth
            crossAxisownerSize = ownerHeight
            measureModeMainDimension = widthMeasureMode
            measureModeCrossDimension = heightMeasureMode
        } else {
            mainAxisOwnerSize = ownerHeight
            crossAxisownerSize = ownerWidth
            measureModeMainDimension = heightMeasureMode
            measureModeCrossDimension = widthMeasureMode
        }
        
        let leadingPaddingAndBorderCross: Float = getLeadingPaddingAndBorder(
            axis: crossAxis, widthSize: ownerWidth)
        let paddingAndBorderAxisMain: Float = getPaddingAndBorderForAxis(
            axis: mainAxis, widthSize: ownerWidth)
        let paddingAndBorderAxisCross: Float = getPaddingAndBorderForAxis(
            axis: crossAxis, widthSize: ownerWidth)
        
        let paddingAndBorderAxisRow: Float
        let paddingAndBorderAxisColumn: Float
        if isMainAxisRow {
            paddingAndBorderAxisRow = paddingAndBorderAxisMain
            paddingAndBorderAxisColumn = paddingAndBorderAxisCross
        } else {
            paddingAndBorderAxisRow = paddingAndBorderAxisCross
            paddingAndBorderAxisColumn = paddingAndBorderAxisMain
        }
        
        let marginAxisRow: Float = getMarginForAxis(
            axis: .row, widthSize: ownerWidth)
        let marginAxisColumn: Float = getMarginForAxis(
            axis: .column, widthSize: ownerWidth)
        
        let minInnerWidth: Float? = self.style.min.width.resolve(
            size: ownerWidth) - paddingAndBorderAxisRow
        let maxInnerWidth: Float? = self.style.max.width.resolve(
            size: ownerWidth) - paddingAndBorderAxisRow
        
        let minInnerHeight: Float? = self.style.min.height.resolve(
            size: ownerHeight) - paddingAndBorderAxisColumn
        let maxInnerHeight: Float? = self.style.max.height.resolve(
            size: ownerWidth) - paddingAndBorderAxisColumn
        
        let minInnerMainDimension: Float?
        let maxInnerMainDimension: Float?
        if isMainAxisRow {
            minInnerMainDimension = minInnerWidth
            maxInnerMainDimension = maxInnerWidth
        } else {
            minInnerMainDimension = minInnerHeight
            maxInnerMainDimension = maxInnerHeight
        }
        
        // STEP 2: DETERMINE AVAILABLE SIZE IN MAIN AND CROSS DIRECTIONS
        
        let availableInnerWidth: Float = calculateAvailableInnerDimensions(
            axis: .row,
            availableDimension: availableWidth,
            ownerDimension: ownerWidth)
        
        let availableInnerHeight: Float = calculateAvailableInnerDimensions(
            axis: .column,
            availableDimension: availableHeight,
            ownerDimension: ownerHeight)
        
        var availableInnerMainDimension: Float
        var availableInnerCrossDimension: Float
        
        if isMainAxisRow {
            availableInnerMainDimension = availableInnerWidth
            availableInnerCrossDimension = availableInnerHeight
        } else {
            availableInnerMainDimension = availableInnerHeight
            availableInnerCrossDimension = availableInnerWidth
        }
        
        // STEP 3: DETERMINE FLEX BASIS FOR EACH ITEM
        
        let totalOuterFlexBasis: Float = computeFlexBasisForChildren(
            availableInnerWidth: availableInnerWidth,
            availableInnerHeight: availableInnerHeight,
            widthMeasureMode: widthMeasureMode,
            heightMeasureMode: heightMeasureMode,
            direction: direction,
            mainAxis: mainAxis,
            config: config,
            shouldPerformFullLayout: shouldPerformFullLayout,
            context: context)
        
        let flexBasisOverflows: Bool
        if measureModeMainDimension == .undefined {
            flexBasisOverflows = false
        } else {
            flexBasisOverflows = totalOuterFlexBasis > availableInnerMainDimension
        }
        if
            isNodeFlexWrap,
            flexBasisOverflows,
            measureModeMainDimension == .atMost
        {
            measureModeMainDimension = .exactly
        }
        
        // STEP 4: COLLECT FLEX ITEMS INTO FLEX LINES
        
        // Indexes of children that represent the first and last items in the line.
        var startOfLineIndex: Int = 0
        var endOfLineIndex: Int = 0
        
        // Number of lines.
        var lineCount = 0
        
        // Accumulated cross dimensions of all lines so far.
        var totalLineCrossDim: Float = 0.0
        
        // Max main dimension of all the lines.
        var maxLineMainDim: Float = 0.0
        
        let childCount = _children.count

        var collectedFlexItemsValues: CollectFlexItemsRowValues<T>
        while endOfLineIndex < childCount {
            collectedFlexItemsValues = self.calculateCollectFlexItemsRowValues(
                ownerDirection: ownerDirection,
                mainAxisOwnerSize: mainAxisOwnerSize,
                availableInnerWidth: availableInnerWidth,
                availableInnerMainDimension: availableInnerMainDimension,
                startOfLineIndex: startOfLineIndex,
                lineCount: lineCount)
            endOfLineIndex = collectedFlexItemsValues.endOfLineIndex
            
            // If we don't need to measure the cross axis, we can skip the
            //entire flex step.
            let canSkipFlex: Bool = !shouldPerformFullLayout &&
                measureModeCrossDimension == .exactly
            
            // STEP 5: RESOLVING FLEXIBLE LENGTHS ON MAIN AXIS
            // Calculate the remaining available space that needs to be
            // allocated.
            // If the main dimension size isn't known, it is computed based on
            // the line length, so there's no more space left to distribute.
            
            var sizeBasedOnContent = false
            // If we don't measure with exact main dimension we want to ensure
            // we don't violate min and max
            if measureModeMainDimension != .exactly {
                if
                    let minInnerMainDim = minInnerMainDimension,
                    Float(collectedFlexItemsValues.sizeConsumedOnCurrentLine) <
                    minInnerMainDimension
                {
                    availableInnerMainDimension = minInnerMainDim
                } else if
                    let maxInnerMainDim = maxInnerMainDimension,
                    Float(collectedFlexItemsValues.sizeConsumedOnCurrentLine) >
                    maxInnerMainDimension
                {
                    availableInnerMainDimension = maxInnerMainDim
                } else {
                    
                    if
                        collectedFlexItemsValues.totalFlexGrowFactors == 0.0 ||
                            self.resolveFlexGrow() == 0.0
                    {
                        // If we don't have any children to flex or we can't
                        // flex the node itself, space we've used is all space
                        // we need. Root node also should be shrunk to minimum.
                        availableInnerMainDimension =
                            Float(collectedFlexItemsValues
                                .sizeConsumedOnCurrentLine)
                    }
                    
                    sizeBasedOnContent = true
                }
            }
            
            if !sizeBasedOnContent {
                collectedFlexItemsValues.remainingFreeSpace =
                    availableInnerMainDimension - Float(
                        collectedFlexItemsValues.sizeConsumedOnCurrentLine)
            } else if collectedFlexItemsValues.sizeConsumedOnCurrentLine < 0 {
                // availableInnerMainDim is indefinite which means the node is
                // being sized based on its content. sizeConsumedOnCurrentLine
                // is negative which means the node will allocate 0 points for
                // its content. Consequently, remainingFreeSpace is
                // 0 - sizeConsumedOnCurrentLine.
                collectedFlexItemsValues.remainingFreeSpace =
                    -Float(collectedFlexItemsValues.sizeConsumedOnCurrentLine)
            }
            
            if !canSkipFlex {
                self.resolveFlexibleLength(
                    collectedFlexItemsValues: &collectedFlexItemsValues,
                    mainAxis: mainAxis,
                    crossAxis: crossAxis,
                    mainAxisownerSize: mainAxisOwnerSize,
                    availableInnerMainDim: availableInnerMainDimension,
                    availableInnerCrossDim: availableInnerCrossDimension,
                    availableInnerWidth: availableInnerWidth,
                    availableInnerHeight: availableInnerHeight,
                    flexBasisOverflows: flexBasisOverflows,
                    measureModeCrossDim: measureModeCrossDimension,
                    shouldPerformFullLayout: shouldPerformFullLayout,
                    config: config,
                    context: context)
            }
            
            self.layout.hasOverflow = self.layout.hasOverflow || (collectedFlexItemsValues.remainingFreeSpace < 0)
            
            // STEP 6: MAIN-AXIS JUSTIFICATION & CROSS-AXIS SIZE DETERMINATION
            
            // At this point, all the children have their dimensions set in the main
            // axis.
            // Their dimensions are also set in the cross axis with the exception of
            // items
            // that are aligned "stretch". We need to compute these stretch values and
            // set the final positions.
            
            self.justifyMainAxis(
                collectedFlexItemsValues: &collectedFlexItemsValues,
                startOfLineIndex: startOfLineIndex,
                mainAxis: mainAxis,
                crossAxis: crossAxis,
                measureModeMainDim: measureModeMainDimension,
                measureModeCrossDim: measureModeCrossDimension,
                mainAxisownerSize: mainAxisOwnerSize,
                ownerWidth: ownerWidth,
                availableInnerMainDim: availableInnerMainDimension,
                availableInnerCrossDim: availableInnerCrossDimension,
                availableInnerWidth: availableInnerWidth,
                shouldPerformFullLayout: shouldPerformFullLayout,
                processingContext: context)
            
            var containerCrossAxis = availableInnerCrossDimension
            switch measureModeCrossDimension {
            case .undefined: fallthrough
            case .atMost:
                containerCrossAxis = self.boundAxis(
                    axis: crossAxis,
                    value: collectedFlexItemsValues.crossDim + paddingAndBorderAxisCross,
                    axisSize: crossAxisownerSize,
                    widthSize: ownerWidth) - paddingAndBorderAxisCross
            case .exactly: break
            }
            
            // If there's no flex wrap, the cross dimension is defined by the container.
            if
                !isNodeFlexWrap,
                measureModeCrossDimension == MeasureMode.exactly
            {
                collectedFlexItemsValues.crossDim = availableInnerCrossDimension
            }
            
            // Clamp to the min/max size specified on the container.
            collectedFlexItemsValues.crossDim = self.boundAxis(
                axis: crossAxis,
                value: collectedFlexItemsValues.crossDim + paddingAndBorderAxisCross,
                axisSize: crossAxisownerSize,
                widthSize: ownerWidth) - paddingAndBorderAxisCross
            
            // STEP 7: CROSS-AXIS ALIGNMENT
            // We can skip child alignment if we're just measuring the container.
            
            if shouldPerformFullLayout {
                for i in startOfLineIndex..<endOfLineIndex {
                    let child = _children[i]
                    guard child.style.display != .none else { continue }
                    
                    switch child.style.positionType {
                    case .absolute:
                        // If the child is absolutely positioned and has a
                        // top/left/bottom/right set, override
                        // all the previously computed positions to set it correctly.
                        let isChildLeadingPosDefined: Bool = child.isLeadingPositionDefined(forAxis: crossAxis)
                        if isChildLeadingPosDefined {
                            child.layout.position[crossAxis] = (child.getLeadingPosition(axis: crossAxis, axisSize: availableInnerCrossDimension) ?? 0.0) + self.getLeadingBorder(axis: crossAxis)
                                + child.getLeadingMargin(axis: crossAxis, widthSize: availableInnerWidth)
                        }
                        // If leading position is not defined or calculations result in Nan,
                        // default to border + margin
                        // if (!isChildLeadingPosDefined || YGFloatIsUndefined(child->getLayout().position[pos[crossAxis]])) ")
                        if !isChildLeadingPosDefined {
                            child.layout.position[crossAxis] = self.getLeadingBorder(axis: crossAxis) + child.getLeadingMargin(axis: crossAxis, widthSize: availableInnerWidth)
                        }
                    case .relative:
                        var leadingCrossDim: Float = leadingPaddingAndBorderCross // 0.0
                        
                        // For a relative children, we're either using alignItems (owner) or
                        // alignSelf (child) in order to determine the position in the cross
                        // axis
                        let alignItem: Align = self.alignItems(child: child) // .stretch
                        
                        // If the child uses align stretch, we need to lay it out one more
                        // time, this time
                        // forcing the cross-axis size to be the computed cross size for the
                        // current line.
                        if
                            alignItem == .stretch,
                            child.marginLeadingValue(axis: crossAxis).unit != .auto,
                            child.marginTrailingValue(axis: crossAxis).unit != .auto
                        {
                            // If the child defines a definite size for its cross axis, there's
                            // no need to stretch.
                            if !child.isStyleDimDefined(
                                for: crossAxis,
                                ownerSize: availableInnerCrossDimension)
                            {
                                var childMainSize: Float? = child.layout.measuredDimensions[mainAxis.dimension] // 10.0
                                var childCrossSize: Float? // 100.0
                                if let aspectRatio = child.style.aspectRatio {
                                    childCrossSize = child.getMarginForAxis(axis: crossAxis, widthSize: availableInnerWidth) + (
                                        isMainAxisRow ? (childMainSize / aspectRatio) : (childMainSize * aspectRatio)
                                    )
                                } else {
                                    childCrossSize = collectedFlexItemsValues.crossDim
                                }
                                
                                childMainSize = (childMainSize ?? 0.0) + child.getMarginForAxis(
                                    axis: mainAxis,
                                    widthSize: availableInnerWidth) // 20.0
                                
                                var childMainMeasureMode: MeasureMode = .exactly
                                var childCrossMeasureMode: MeasureMode = .exactly
                                
                                child.constrainMax(
                                    axis: mainAxis,
                                    ownerAxisSize: availableInnerMainDimension,
                                    ownerWidth: availableInnerWidth,
                                    mode: &childMainMeasureMode,
                                    size: &childMainSize)
                                child.constrainMax(
                                    axis: crossAxis,
                                    ownerAxisSize: availableInnerCrossDimension,
                                    ownerWidth: availableInnerWidth,
                                    mode: &childCrossMeasureMode,
                                    size: &childCrossSize)
                                
                                let childWidth: Float?
                                let childHeight: Float?
                                if isMainAxisRow {
                                    childWidth = childMainSize
                                    childHeight = childCrossSize
                                } else {
                                    childWidth = childCrossSize
                                    childHeight = childMainSize
                                }
                                
                                let childWidthMeasureMode: MeasureMode
                                let childHeightMeasureMode: MeasureMode
                                
                                if childWidth == nil {
                                    childWidthMeasureMode = .undefined
                                } else {
                                    childWidthMeasureMode = .exactly
                                }
                                if childHeight == nil {
                                    childHeightMeasureMode = .undefined
                                } else {
                                    childHeightMeasureMode = .exactly
                                }
                                
                                child.performLayoutIfNeeded(
                                    availableWidth: childWidth,
                                    availableHeight: childHeight,
                                    widthMeasureMode: childWidthMeasureMode,
                                    heightMeasureMode: childHeightMeasureMode,
                                    ownerWidth: availableInnerWidth,
                                    ownerHeight: availableInnerHeight,
                                    ownerDirection: direction,
                                    shouldPerformFullLayout: true,
                                    reason: "stretch",
                                    config: config,
                                    context: context)
                            }
                        } else {
                            let remainingCrossDim: Float = containerCrossAxis - child.dimensionWithMargin(
                                axis: crossAxis,
                                widthSize: availableInnerWidth)
                            
                            if
                                child.marginLeadingValue(axis: crossAxis).unit == .auto,
                                child.marginTrailingValue(axis: crossAxis).unit == .auto
                            {
                                leadingCrossDim += max(0.0, remainingCrossDim * 0.5)
                            } else if child.marginTrailingValue(axis: crossAxis).unit == .auto {
                                // No-Op
                            } else if child.marginLeadingValue(axis: crossAxis).unit == .auto {
                                leadingCrossDim += max(0.0, remainingCrossDim)
                            } else if alignItem == .flexStart {
                                // No-Op
                            } else if alignItem == .center {
                                leadingCrossDim += remainingCrossDim * 0.5
                            } else {
                                leadingCrossDim += remainingCrossDim
                            }
                        }
                        
                        // And we apply the position
                        child.layout.position[crossAxis] += totalLineCrossDim + leadingCrossDim
                    }
                }
            }
            
            totalLineCrossDim += collectedFlexItemsValues.crossDim
            maxLineMainDim = max(maxLineMainDim, collectedFlexItemsValues.mainDim)
            
            // END while loop
            lineCount += 1
            startOfLineIndex = endOfLineIndex
        }
        
        // STEP 8: MULTI-LINE CONTENT ALIGNMENT
        // currentLead stores the size of the cross dim
        if shouldPerformFullLayout, (lineCount > 1 || self.isBaselineLayout) {
            var crossDimLead: Float = 0.0
            var currentLead: Float = leadingPaddingAndBorderCross
            if !(availableInnerCrossDimension ~= Float.greatestFiniteMagnitude) {
                let remainingAlignContentDimension = availableInnerCrossDimension - totalLineCrossDim
                switch self.style.alignContent {
                case .flexEnd:
                    currentLead += remainingAlignContentDimension
                case .center:
                    currentLead += remainingAlignContentDimension * 0.5
                case .stretch:
                    if availableInnerCrossDimension > totalLineCrossDim {
                        crossDimLead = remainingAlignContentDimension / Float(lineCount)
                    }
                case .spaceAround:
                    if availableInnerCrossDimension > totalLineCrossDim {
                        currentLead += remainingAlignContentDimension / (2.0 * Float(lineCount))
                        if lineCount > 1 {
                            crossDimLead = remainingAlignContentDimension / Float(lineCount)
                        }
                    } else {
                        currentLead += remainingAlignContentDimension * 0.5
                    }
                case .spaceBetween:
                    if availableInnerCrossDimension > totalLineCrossDim && lineCount > 1 {
                        crossDimLead = remainingAlignContentDimension / Float(lineCount - 1)
                    }
                case .auto: break
                case .flexStart: break
                case .baseline: break
                }
                
            }
            
            var endIndex: Int = 0
            
            for i in 0..<lineCount {
                let startIndex = endIndex
                // compute the line's height and find the endIndex
                var lineHeight: Float = 0.0
                var maxAscentForCurrentLine: Float = 0.0
                var maxDescentForCurrentLine: Float = 0.0
                var ii: Int = startIndex
                while ii < childCount {
                    let child = _children[ii]
                    guard child.style.display != .none else { continue }
                    if child.style.positionType == .relative {
                        guard child.layout.lineIndex == i  else { break }
                        if child.isLayoutDimensionDefined(for: crossAxis) {
                            lineHeight = max(
                                lineHeight,
                                child.layout.measuredDimensions[crossAxis.dimension] +
                                    child.getMarginForAxis(
                                        axis: crossAxis,
                                        widthSize: availableInnerWidth)
                            )
                        }
                        if self.alignItems(child: child) == .baseline {
                            let ascent: Float = child.getBaseline(processingContext: context) + child.getLeadingMargin(
                                axis: .column, widthSize: availableInnerWidth)
                            let descent: Float = child.layout.measuredDimensions.height + child.getMarginForAxis(axis: .column, widthSize: availableInnerWidth) - ascent
                            maxAscentForCurrentLine = max(maxAscentForCurrentLine, ascent)
                            maxDescentForCurrentLine = max(maxDescentForCurrentLine, descent)
                            lineHeight = max(lineHeight, maxAscentForCurrentLine + maxDescentForCurrentLine)
                        }
                    }
                    ii += 1
                }
                endIndex = ii
                
                lineHeight += crossDimLead
                if shouldPerformFullLayout {
                    for child in _children[startIndex..<endIndex] {
                        guard child.style.display != .none else { continue }
                        guard child.style.positionType == .relative else { continue }
                        switch self.alignItems(child: child) {
                        case .flexStart:
                            child.layout.position[crossAxis] = currentLead +
                                child.getLeadingMargin(
                                    axis: crossAxis,
                                    widthSize: availableInnerWidth)
                        case .flexEnd:
                            child.layout.position[crossAxis] = currentLead +
                                lineHeight -
                                child.getTrailingMargin(
                                    axis: crossAxis,
                                    widthSize: availableInnerWidth) -
                                child.layout.measuredDimensions[crossAxis.dimension]
                        case .center:
                            let childHeight = child.layout.measuredDimensions[crossAxis.dimension]
                            child.layout.position[crossAxis] = currentLead + (lineHeight - childHeight) * 0.5
                        case .stretch:
                            child.layout.position[crossAxis] = currentLead +
                                child.getLeadingMargin(
                                    axis: crossAxis,
                                    widthSize: availableInnerWidth)
                            
                            // Remeasure child with the line height as it as been only
                            // measured with the owners height yet.
                            if !child.isStyleDimDefined(
                                for: crossAxis,
                                ownerSize: availableInnerCrossDimension)
                            {
                                let childWidth: Float
                                if isMainAxisRow {
                                    childWidth = child.layout.measuredDimensions.width + child.getMarginForAxis(
                                            axis: mainAxis,
                                            widthSize: availableInnerWidth)
                                } else {
                                    childWidth = lineHeight
                                }
                                
                                let childHeight: Float
                                if !isMainAxisRow {
                                    childHeight = child.layout.measuredDimensions.height +
                                        child.getMarginForAxis(
                                            axis: crossAxis,
                                            widthSize: availableInnerWidth)
                                } else {
                                    childHeight = lineHeight
                                }
                                
                                if
                                    !(childWidth ~= child.layout.measuredDimensions.width &&
                                    childHeight ~= child.layout.measuredDimensions.height)
                                {
                                    child.performLayoutIfNeeded(
                                        availableWidth: childWidth,
                                        availableHeight: childHeight,
                                        widthMeasureMode: .exactly,
                                        heightMeasureMode: .exactly,
                                        ownerWidth: availableInnerWidth,
                                        ownerHeight: availableInnerHeight,
                                        ownerDirection: direction,
                                        shouldPerformFullLayout: true,
                                        reason: "multiline-stretch",
                                        config: config,
                                        context: context)
                                }
                            }
                        case .baseline:
                            child.layout.position.top = currentLead +
                                maxAscentForCurrentLine -
                                child.getBaseline(processingContext: context) +
                                (child.getLeadingPosition(
                                    axis: .column,
                                    axisSize: availableInnerCrossDimension) ?? 0.0)
                        case .auto: break
                        case .spaceBetween: break
                        case .spaceAround: break
                        }
                    }
                }
                currentLead += lineHeight
            }
        }
        
        // STEP 9: COMPUTING FINAL DIMENSIONS
        self.layout.measuredDimensions.width = self.boundAxis(
            axis: .row,
            value: availableWidth - marginAxisRow,
            axisSize: ownerWidth,
            widthSize: ownerWidth)
        
        self.layout.measuredDimensions.height = self.boundAxis(
            axis: .column,
            value: availableHeight - marginAxisColumn,
            axisSize: ownerHeight,
            widthSize: ownerWidth)
        
        // If the user didn't specify a width or height for the node, set the
        // dimensions based on the children.
        if measureModeMainDimension == .undefined ||
            (self.style.overflow != .scroll &&
                measureModeMainDimension == .atMost)
        {
            // Clamp the size to the min/max size, if specified, and make sure it
            // doesn't go below the padding and border amount.
            self.layout.measuredDimensions[mainAxis.dimension] = self.boundAxis(
                axis: mainAxis,
                value: maxLineMainDim,
                axisSize: mainAxisOwnerSize,
                widthSize: ownerWidth)
        } else if
            measureModeMainDimension == .atMost,
            self.style.overflow == .scroll
        {
            self.layout.measuredDimensions[mainAxis.dimension] = max(
                min(
                    availableInnerMainDimension + paddingAndBorderAxisMain,
                    self.boundAxisWithinMinAndMax(
                        axis: mainAxis,
                        value: maxLineMainDim,
                        axisSize: mainAxisOwnerSize) ?? Float.greatestFiniteMagnitude // since min()
                ),
                paddingAndBorderAxisMain)
        }
        
        if measureModeCrossDimension == .undefined ||
            (self.style.overflow != .scroll &&
                measureModeCrossDimension == .atMost)
        {
            // Clamp the size to the min/max size, if specified, and make sure it
            // doesn't go below the padding and border amount.
            self.layout.measuredDimensions[crossAxis.dimension] = self.boundAxis(
                axis: crossAxis,
                value: totalLineCrossDim + paddingAndBorderAxisCross,
                axisSize: crossAxisownerSize,
                widthSize: ownerWidth)
        } else if
            measureModeCrossDimension == .atMost,
            self.style.overflow == .scroll
        {
            self.layout.measuredDimensions[crossAxis.dimension] = max(
                min(
                    availableInnerCrossDimension + paddingAndBorderAxisCross,
                    self.boundAxisWithinMinAndMax(
                        axis: crossAxis,
                        value: totalLineCrossDim + paddingAndBorderAxisCross,
                        axisSize: crossAxisownerSize) ?? Float.greatestFiniteMagnitude
                ),
                paddingAndBorderAxisCross
            )
        }
        
        // As we only wrapped in normal direction yet, we need to reverse the
        // positions on wrap-reverse.
        if
            shouldPerformFullLayout,
            self.style.flexWrap == .wrapReverse
        {
            for child in _children {
                if child.style.positionType == .relative {
                    child.layout.position[crossAxis] =
                        self.layout.measuredDimensions[crossAxis.dimension] -
                        child.layout.position[crossAxis] -
                        child.layout.measuredDimensions[crossAxis.dimension]
                }
            }
        }
        
        if (shouldPerformFullLayout) {
            // STEP 10: SIZING AND POSITIONING ABSOLUTE CHILDREN
            for child in _children {
                guard child.style.positionType == .absolute else { continue }
                self.performAbsoluteLayout(
                    for: child,
                    width: availableInnerWidth,
                    widthMode: isMainAxisRow ? measureModeMainDimension : measureModeCrossDimension,
                    height: availableInnerHeight,
                    direction: direction,
                    config: config,
                    context: context)
            }
            
            
            // STEP 11: SETTING TRAILING POSITIONS FOR CHILDREN
            let needsMainTrailingPos = (mainAxis == .rowReverse || mainAxis == .reverse)
            let needsCrossTrailingPos = (crossAxis == .rowReverse || crossAxis == .reverse)
            
            // Set trailing position if necessary.
            if needsMainTrailingPos || needsCrossTrailingPos {
                for child in _children {
                    guard child.style.display != .none else { continue }
                    if needsMainTrailingPos {
                        self.setChildTrailingPosition(child: child, axis: mainAxis)
                    }
                    
                    if needsCrossTrailingPos {
                        self.setChildTrailingPosition(child: child, axis: crossAxis)
                    }
                }
            }
        }
    }
    
    func performAbsoluteLayout(
        for child: FlexNode,
        width: Float?,
        widthMode: MeasureMode,
        height: Float?,
        direction: Direction,
        config: Config,
        context: ProcessingContext
        ) -> Void
    {
        let mainAxis: FlexDirection = self.style.flexDirection.resolve(
            direction: direction)
        let crossAxis: FlexDirection = mainAxis.cross(direction: direction)
        let isMainAxisRow: Bool = mainAxis.isRow
        
        var childWidth: Float? = nil
        var childHeight: Float? = nil
        var childWidthMeasureMode: MeasureMode = .undefined
        var childHeightMeasureMode: MeasureMode = .undefined
        
        let marginRow: Float = child.getMarginForAxis(
            axis: .row, widthSize: width)
        let marginColumn: Float = child.getMarginForAxis(
            axis: .column, widthSize: width)
        
        if child.isStyleDimDefined(for: .row, ownerSize: width) {
            childWidth = child.resolvedDimensions.width.resolve(size: width) + marginRow
        } else {
            // If the child doesn't have a specified width, compute the width based
            // on the left/right
            // offsets if they're defined.
            if
                child.isLeadingPositionDefined(forAxis: .row),
                child.isTrailingPosDefined(forAxis: .row)
            {
                childWidth = self.layout.measuredDimensions.width -
                    (self.getLeadingBorder(axis: .row) + self.getTrailingBorder(axis: .row)) -
                    (child.getLeadingPosition(axis: .row, axisSize: width) +
                        child.getTrailingPosition(axis: .row, axisSize: width))
                childWidth = child.boundAxis(
                    axis: .row,
                    value: childWidth,
                    axisSize: width,
                    widthSize: width)
            }
        }
        
        if child.isStyleDimDefined(
            for: .column, ownerSize: height)
        {
            childHeight = child.resolvedDimensions.height.resolve(size: height) + marginColumn
        } else {
            // If the child doesn't have a specified height, compute the height
            // based on the top/bottom
            // offsets if they're defined.
            if
                child.isLeadingPositionDefined(forAxis: .column),
                child.isTrailingPosDefined(forAxis: .column)
            {
                childHeight = self.layout.measuredDimensions.height -
                    (self.getLeadingBorder(axis: .column) +
                        self.getTrailingBorder(axis: .column)) -
                        (child.getLeadingPosition(axis: .column, axisSize: height) +
                            child.getTrailingPosition(axis: .column, axisSize: height))
                childHeight = child.boundAxis(
                    axis: .column,
                    value: childHeight,
                    axisSize: height,
                    widthSize: width)
            }
        }
        
        // Exactly one dimension needs to be defined for us to be able to do aspect
        // ratio calculation. One dimension being the anchor and the other being
        // flexible.
        if let aspectRatio = child.style.aspectRatio {
            switch (childWidth, childHeight) {
            case (.some, .some): break
            case (.none, .none): break
            case (.some(let w), .none):
                childHeight = marginColumn + (w - marginRow) / aspectRatio
            case (.none, .some(let h)):
                childWidth = marginRow + (h - marginColumn) * aspectRatio
            }
        }
        
        // If we're still missing one or the other dimension, measure the content.
        if childWidth == nil || childHeight == nil {
        
            if childWidth == nil {
                childWidthMeasureMode = .undefined
            } else {
                childWidthMeasureMode = .exactly
            }
            
            if childHeight == nil {
                childHeightMeasureMode = .undefined
            } else {
                childHeightMeasureMode = .exactly
            }
            
            // If the size of the owner is defined then try to constrain the absolute
            // child to that size as well. This allows text within the absolute child to
            // wrap to the size of its owner. This is the same behavior as many browsers
            // implement.
            if
                !isMainAxisRow,
                childWidth == nil,
                widthMode != .undefined,
                let w = width,
                w > 0.0
            {
                childWidth = w
                childWidthMeasureMode = .atMost
            }
            
            child.performLayoutIfNeeded(
                availableWidth: childWidth,
                availableHeight: childHeight,
                widthMeasureMode: childWidthMeasureMode,
                heightMeasureMode: childHeightMeasureMode,
                ownerWidth: childWidth,
                ownerHeight: childHeight,
                ownerDirection: direction,
                shouldPerformFullLayout: false,
                reason: "abs-measure",
                config: config,
                context: context)
            
            childWidth = child.layout.measuredDimensions.width +
                child.getMarginForAxis(
                    axis: .row, widthSize: width)
            childHeight = child.layout.measuredDimensions.height +
                child.getMarginForAxis(
                    axis: .column, widthSize: width)
        }
        
        child.performLayoutIfNeeded(
            availableWidth: childWidth,
            availableHeight: childHeight,
            widthMeasureMode: .exactly,
            heightMeasureMode: .exactly,
            ownerWidth: childWidth,
            ownerHeight: childHeight,
            ownerDirection: direction,
            shouldPerformFullLayout: true,
            reason: "abs-layout",
            config: config,
            context: context)
        
        if
            child.isTrailingPosDefined(forAxis: mainAxis),
            !child.isLeadingPositionDefined(forAxis: mainAxis)
        {
            child.layout.position[mainAxis] = self.layout.measuredDimensions[mainAxis.dimension] -
                child.layout.measuredDimensions[mainAxis.dimension] -
                self.getTrailingBorder(axis: mainAxis) -
                child.getTrailingMargin(axis: mainAxis, widthSize: width) -
                (child.getTrailingPosition(axis: mainAxis, axisSize: isMainAxisRow ? width : height) ?? 0.0)
        } else if
            !child.isLeadingPositionDefined(forAxis: mainAxis),
            self.style.justifyContent == .center
        {
            let measuredMainAxisDimension = self.layout.measuredDimensions[mainAxis.dimension]
            let childMeasuredMainAxisDimension = child.layout.measuredDimensions[mainAxis.dimension]
            child.layout.position[mainAxis] = (measuredMainAxisDimension - childMeasuredMainAxisDimension) * 0.5
        } else if
            !child.isLeadingPositionDefined(forAxis: mainAxis),
            self.style.justifyContent == .flexEnd
        {
            child.layout.position[mainAxis] = self.layout.measuredDimensions[mainAxis.dimension] -
                child.layout.measuredDimensions[mainAxis.dimension]
        }
        
        if
            child.isTrailingPosDefined(forAxis: crossAxis),
            !child.isLeadingPositionDefined(forAxis: crossAxis)
        {
            child.layout.position[crossAxis] = self.layout.measuredDimensions[crossAxis.dimension] -
                child.layout.measuredDimensions[crossAxis.dimension] -
                self.getTrailingBorder(axis: crossAxis) -
                child.getTrailingMargin(axis: crossAxis, widthSize: width) -
                (child.getTrailingPosition(axis: crossAxis, axisSize: isMainAxisRow ? height : width) ?? 0.0)
        } else if
            !child.isLeadingPositionDefined(forAxis: crossAxis),
            self.alignItems(child: child) == .center
        {
            let measuredCrossAxisDimension = self.layout.measuredDimensions[crossAxis.dimension]
            let childMeasuredCrossAxisDimension = child.layout.measuredDimensions[crossAxis.dimension]
            child.layout.position[crossAxis] = (measuredCrossAxisDimension -
                childMeasuredCrossAxisDimension) * 0.5
        } else if
            !child.isLeadingPositionDefined(forAxis: crossAxis)
        {
            switch (self.alignItems(child: child) == .flexEnd, self.style.flexWrap == .wrapReverse) {
            case (true, true): break
            case (false, false): break
            case (true, false): fallthrough
            case (false, true):
                child.layout.position[crossAxis] = self.layout.measuredDimensions[crossAxis.dimension] -
                    child.layout.measuredDimensions[crossAxis.dimension]
                break
            }
        }
    }
    
    func setChildTrailingPosition(
        child: FlexNode,
        axis: FlexDirection
        ) -> Void
    {
        let size: Float = child.layout.measuredDimensions[axis.dimension]
        child.layout.position[trailing: axis] =
            self.layout.measuredDimensions[axis.dimension] -
                size -
                child.layout.position[axis]
    }
    
    internal func canUseCachedMeasurement(
        widthMode: MeasureMode,
        availableWidth: Float?,
        heightMode: MeasureMode,
        availableHeight: Float?,
        cachedMeasurement: CachedMeasurement?,
        marginRow: Float,
        marginColumn: Float,
        config: Config
        ) -> Bool
    {
        guard
            let measurements = cachedMeasurement,
            measurements.computedHeight >= 0.0,
            measurements.computedWidth >= 0.0,
            let width = availableWidth,
            let height = availableHeight
            else { return false }
        
        let useRoundedComparison = config.pointScaleFactor != 0.0
        let pointScaleFactor = config.pointScaleFactor
        
        let effectiveWidth: Float
        let effectiveHeight: Float
        let effectiveLastWidth: Float
        let effectiveLastHeight: Float

        if useRoundedComparison {
            effectiveWidth = roundValueToPixelGrid(
                value: width,
                pointScaleFactor: pointScaleFactor)
            effectiveHeight = roundValueToPixelGrid(
                value: height,
                pointScaleFactor: pointScaleFactor)
            effectiveLastWidth = roundValueToPixelGrid(
                value: measurements.computedWidth,
                pointScaleFactor: pointScaleFactor)
            effectiveLastHeight = roundValueToPixelGrid(
                value: measurements.computedHeight,
                pointScaleFactor: pointScaleFactor)
        } else {
            effectiveWidth = width
            effectiveHeight = height
            effectiveLastWidth = measurements.computedWidth
            effectiveLastHeight = measurements.computedHeight
        }
        
        let hasSameWidthSpec: Bool = measurements
            .widthMeasureMode == widthMode &&
            effectiveLastWidth ~= effectiveWidth
        
        let hasSameHeightSpec: Bool = measurements
            .heightMeasureMode == heightMode &&
            effectiveLastHeight ~= effectiveHeight
        
        @inline(__always)
        func measureModeSizeIsExactAndMatchesOldMeasuredSize(
            sizeMode: MeasureMode,
            size: Float,
            lastComputedSize: Float
            ) -> Bool
        {
            return sizeMode == .exactly && size ~= lastComputedSize
        }
        
        @inline(__always)
        func measureModeOldSizeIsUnspecifiedAndStillFits(
            sizeMode: MeasureMode,
            size: Float,
            lastSizeMode: MeasureMode,
            lastComputedSize: Float
            ) -> Bool
        {
            return sizeMode == .atMost &&
                lastSizeMode == .undefined &&
                (size >= lastComputedSize || size ~= lastComputedSize)
        }
        
        @inline(__always)
        func measureModeNewMeasureSizeIsStricterAndStillValid(
            sizeMode: MeasureMode,
            float size: Float?,
            lastSizeMode: MeasureMode,
            lastSize: Float?,
            lastComputedSize: Float
            ) -> Bool
        {
            return lastSizeMode == .atMost &&
                sizeMode == .atMost && lastSize != nil &&
                size != nil &&
                lastSize > size &&
                (lastComputedSize <= size || size ~= lastComputedSize)
        }
        
        let widthIsCompatible: Bool = hasSameWidthSpec ||
            measureModeSizeIsExactAndMatchesOldMeasuredSize(
                sizeMode: widthMode, size: width - marginRow,
                lastComputedSize: measurements.computedWidth) ||
            measureModeOldSizeIsUnspecifiedAndStillFits(
                sizeMode: widthMode, size: width - marginRow,
                lastSizeMode: measurements.widthMeasureMode,
                lastComputedSize: measurements.computedWidth) ||
            measureModeNewMeasureSizeIsStricterAndStillValid(
                sizeMode: widthMode, float: width - marginRow,
                lastSizeMode: measurements.widthMeasureMode,
                lastSize: measurements.availableWidth,
                lastComputedSize: measurements.computedWidth)
        
        let heightIsCompatible: Bool = hasSameHeightSpec ||
            measureModeSizeIsExactAndMatchesOldMeasuredSize(
                sizeMode: heightMode, size: height - marginColumn,
                lastComputedSize: measurements.computedHeight) ||
            measureModeOldSizeIsUnspecifiedAndStillFits(
                sizeMode: heightMode, size: height - marginColumn,
                lastSizeMode: measurements.heightMeasureMode,
                lastComputedSize: measurements.computedHeight) ||
            measureModeNewMeasureSizeIsStricterAndStillValid(
                sizeMode: heightMode, float: height - marginColumn,
                lastSizeMode: measurements.heightMeasureMode,
                lastSize: measurements.availableHeight,
                lastComputedSize: measurements.computedHeight)
        
        return widthIsCompatible && heightIsCompatible
    }
    
    @inline(__always) internal func getPaddingAndBorderForAxis(
        axis: FlexDirection,
        widthSize: Float?
        ) -> Float
    {
        let leading = getLeadingPaddingAndBorder(
            axis: axis, widthSize: widthSize)
        let trailing = getTrailingPaddingAndBorder(
            axis: axis, widthSize: widthSize)
        return (leading + trailing)
    }
    
    /// Like boundAxisWithinMinAndMax but also ensures that the value doesn't
    /// go below the padding and border amount.
    @inline(__always) internal func boundAxis(
        axis: FlexDirection,
        value: Float?,
        axisSize: Float?,
        widthSize: Float?
        ) -> Float
    {
        let minMax = boundAxisWithinMinAndMax(
            axis: axis, value: value, axisSize: axisSize)
        let paddingBorder = getPaddingAndBorderForAxis(
            axis: axis, widthSize: widthSize)
        return max(minMax ?? 0.0, paddingBorder)
    }
    
    @inline(__always) internal func boundAxisWithinMinAndMax(
        axis: FlexDirection,
        value: Float?,
        axisSize: Float?
        ) -> Float?
    {
        let min: Float?
        let max: Float?
        
        switch axis {
        case .column: fallthrough
        case .reverse:
            min = style.min.height.resolve(size: axisSize)
            max = style.max.height.resolve(size: axisSize)
        case .row: fallthrough
        case .rowReverse:
            min = style.min.width.resolve(size: axisSize)
            max = style.max.width.resolve(size: axisSize)
        }
        
        if
            let max = max,
            max >= 0.0,
            value > max
        {
            return max
        }
        
        if
            let min = min,
            min >= 0.0,
            value < min
        {
            return min
        }
        
        return value
    }
    
    internal func measureDimensions(
        availableWidth: Float?,
        availableHeight: Float?,
        widthMeasureMode: MeasureMode,
        heightMeasureMode: MeasureMode,
        ownerWidth: Float?,
        ownerHeight: Float?,
        measureFunc: MeasureFunc
        ) -> Void
    {
        let paddingAndBorderAxisRow: Float = getPaddingAndBorderForAxis(
            axis: .row, widthSize: availableWidth)
        let paddingAndBorderAxisColumn: Float = getPaddingAndBorderForAxis(
            axis: .column, widthSize: availableWidth)
        let marginAxisRow: Float = getMarginForAxis(
            axis: .row, widthSize: availableWidth)
        let marginAxisColumn: Float = getMarginForAxis(
            axis: .row, widthSize: availableWidth)
        
        // We want to make sure we don't call measure with negative size
        let innerWidth: Float?
        if let availableWidth = availableWidth {
            let w = availableWidth - marginAxisRow -
            paddingAndBorderAxisRow
            innerWidth = max(0.0, w)
        } else {
            innerWidth = nil
        }
        let innerHeight: Float?
        if let availableHeight = availableHeight {
            let w = availableHeight - marginAxisColumn -
            paddingAndBorderAxisColumn
            innerHeight = max(0.0, w)
        } else {
            innerHeight = nil
        }
        
        if  // Don't bother sizing the text if both dimensions
            // are already defined.
            widthMeasureMode == .exactly,
            heightMeasureMode == .exactly
        {
            layout.measuredDimensions.width = boundAxis(
                axis: .row,
                value: availableWidth - marginAxisRow,
                axisSize: ownerWidth,
                widthSize: ownerWidth)
            layout.measuredDimensions.height = boundAxis(
                axis: .column,
                value: availableHeight - marginAxisColumn,
                axisSize: ownerHeight,
                widthSize: ownerWidth)
        } else {
            // Measure the text under the current constraints.
            let measuredSize: Size = measureFunc(MeasureTask(
                node: self,
                width: innerWidth,
                widthMode: widthMeasureMode,
                height: innerHeight,
                heightMode: heightMeasureMode))
            
            let widthValue: Float?
            if widthMeasureMode != .exactly {
                widthValue = measuredSize.width + paddingAndBorderAxisRow
            } else {
                widthValue = availableWidth - marginAxisRow
            }
            self.layout.measuredDimensions.width =
                boundAxis(
                    axis: .row,
                    value: widthValue,
                    axisSize: ownerWidth,
                    widthSize: ownerWidth)
            
            let heightValue: Float?
            if heightMeasureMode != .exactly {
                heightValue = measuredSize.height + paddingAndBorderAxisColumn
            } else {
                heightValue = availableHeight - marginAxisColumn
            }
            self.layout.measuredDimensions.height =
                boundAxis(
                    axis: .column,
                    value: heightValue,
                    axisSize: ownerHeight,
                    widthSize: ownerWidth)
        }
    }
    
    internal func emptyContainerSetMeasuredDimensions(
        availableWidth: Float?,
        availableHeight: Float?,
        widthMeasureMode: MeasureMode,
        heightMeasureMode: MeasureMode,
        ownerWidth: Float?,
        ownerHeight: Float?
        ) -> Void
    {
        let paddingAndBorderAxisRow: Float = getPaddingAndBorderForAxis(
            axis: .row, widthSize: ownerWidth)
        let paddingAndBorderAxisColumn: Float = getPaddingAndBorderForAxis(
            axis: .column, widthSize: ownerWidth)
        let marginAxisRow: Float = getMarginForAxis(
            axis: .row, widthSize: ownerWidth)
        let marginAxisColumn: Float = getMarginForAxis(
            axis: .column, widthSize: ownerWidth)
        
        let widthValue: Float?
        if widthMeasureMode != .exactly {
            widthValue = paddingAndBorderAxisRow
        } else {
            widthValue = availableWidth - marginAxisRow
        }
        
        let ba: Float = self.boundAxis(
            axis: .row,
            value: widthValue,
            axisSize: ownerWidth,
            widthSize: ownerWidth)
        
        self.layout.measuredDimensions.width = ba
        
        let heightValue: Float?
        if heightMeasureMode != .exactly {
            heightValue = paddingAndBorderAxisColumn
        } else {
            heightValue = availableHeight - marginAxisColumn
        }
        
        self.layout.measuredDimensions.height = boundAxis(
            axis: .column,
            value: heightValue,
            axisSize: ownerHeight,
            widthSize: ownerWidth)
    }
    
    internal func fixedSizeSetMeasuredDimensions(
        availableWidth: Float?,
        availableHeight: Float?,
        widthMeasureMode: MeasureMode,
        heightMeasureMode: MeasureMode,
        ownerWidth: Float?,
        ownerHeight: Float?
        ) -> Bool
    {
        var proceed: Bool = false
        if
            let availableWidth = availableWidth,
            widthMeasureMode == .atMost,
            availableWidth <= 0.0
        {
            proceed = true
        }
        if
            let availableHeight = availableHeight,
            heightMeasureMode == .atMost,
            availableHeight <= 0.0
        {
            proceed = true
        }
        if
            widthMeasureMode == .exactly,
            heightMeasureMode == .exactly
        {
            proceed = true
        }
        guard proceed else { return false }
        
        let marginAxisColumn: Float = getMarginForAxis(
            axis: .column, widthSize: ownerWidth)
        let marginAxisRow: Float = getMarginForAxis(
            axis: .row, widthSize: ownerWidth)
        
        let widthValue: Float?
        if let availableWidth = availableWidth {
            if widthMeasureMode == .atMost, availableWidth < 0.0 {
                widthValue = 0.0
            } else {
                widthValue = availableWidth - marginAxisRow
            }
        } else {
            widthValue = 0.0
        }
        self.layout.measuredDimensions.width = boundAxis(
            axis: .row,
            value: widthValue,
            axisSize: ownerWidth,
            widthSize: ownerWidth)
        
        let heightValue: Float?
        if let availableHeight = availableHeight {
            if heightMeasureMode == .atMost, availableHeight < 0.0 {
                heightValue = 0.0
            } else {
                heightValue = availableHeight - marginAxisColumn
            }
        } else {
            heightValue = 0.0
        }
        self.layout.measuredDimensions.height = boundAxis(
            axis: .column,
            value: heightValue,
            axisSize: ownerHeight,
            widthSize: ownerWidth)

        return true
        
    }
    
    func calculateAvailableInnerDimensions(
        axis: FlexDirection,
        availableDimension: Float?,
        ownerDimension: Float?
        ) -> Float
    {
        let direction: FlexDirection
        let dimension: Dimension
        if axis.isRow {
            direction = .row
            dimension = .width
        } else {
            direction = .column
            dimension = .height
        }
        
        let margin: Float = getMarginForAxis(
            axis: direction, widthSize: ownerDimension)
        let paddingAndBorder: Float = getPaddingAndBorderForAxis(
            axis: direction, widthSize: ownerDimension)
        
        let availableInnerDim: Float? =
            availableDimension  - margin - paddingAndBorder
        // Max dimension overrides predefined dimension value
        // Min dimension in turn overrides both of the above
        if let availableInnerDim = availableInnerDim {
            // We want to make sure our available height does not violate min and max
            // constraints
            let minInnerDim: Float
            if
                let minDim: Float =
                self.style.min[dimension].resolve(size: ownerDimension)
            {
                minInnerDim = minDim - paddingAndBorder
            } else {
                minInnerDim = 0.0
            }
            
            let maxInnerDim: Float
            if
                let maxDim: Float =
                self.style.max[dimension].resolve(size: ownerDimension)
            {
                maxInnerDim = maxDim - paddingAndBorder
            } else {
                maxInnerDim = Float.greatestFiniteMagnitude
            }
            
            return max(min(availableInnerDim, maxInnerDim), minInnerDim)
            
        }
        
        let minInnerDim: Float
        if
            let minDim: Float =
            self.style.min[dimension].resolve(size: ownerDimension)
        {
            minInnerDim = minDim - paddingAndBorder
        } else {
            minInnerDim = 0.0
        }
        
        let maxInnerDim: Float
        if
            let maxDim: Float =
            self.style.max[dimension].resolve(size: ownerDimension)
        {
            maxInnerDim = maxDim - paddingAndBorder
        } else {
            maxInnerDim = Float.greatestFiniteMagnitude
        }
        
        return max(min(availableInnerDim, maxInnerDim), minInnerDim)
        
//        return 0
        
    }
    
    func computeFlexBasisForChildren(
        availableInnerWidth: Float,
        availableInnerHeight: Float,
        widthMeasureMode: MeasureMode,
        heightMeasureMode: MeasureMode,
        direction: Direction,
        mainAxis: FlexDirection,
        config: Config,
        shouldPerformFullLayout: Bool,
        context: ProcessingContext
        ) -> Float
    {
        var totalOuterFlexBasis: Float = 0.0
        var singleFlexChild: FlexNode? = nil
        let children: [FlexNode] = self.children
        
        var measureModeMainDimension: MeasureMode
        if mainAxis.isRow {
            measureModeMainDimension = widthMeasureMode
        } else {
            measureModeMainDimension = heightMeasureMode
        }
        // If there is only one child with flexGrow + flexShrink it means we can set
        // the computedFlexBasis to 0 instead of measuring and shrinking / flexing the
        // child to exactly match the remaining space
        if measureModeMainDimension == .exactly {
            for child in children {
                if child.isNodeFlexible {
                    if singleFlexChild != nil ||
                        child.resolveFlexGrow() ~= 0.0 ||
                        child.resolveFlexShrink() ~= 0.0
                    {
                        // There is already a flexible child, or this flexible child doesn't
                        // have flexGrow and flexShrink, abort
                        singleFlexChild = nil
                        break
                    } else {
                        singleFlexChild = child
                    }
                }
            }
        }
        
        for child in children {
            child.resolveDimension()
            if child.style.display == .none {
                child.zeroOutLayoutRecursivly()
                child.hasNewLayout = true
                child.isDirty = false
                continue
            }
            if shouldPerformFullLayout {
                // Set the initial position (relative to the owner).
                let childDirection: Direction = child.resolveDirection(
                    ownerDirection: direction)
                let mainDimension: Float
                let crossDimension: Float
                if mainAxis.isRow {
                    mainDimension = availableInnerWidth
                    crossDimension = availableInnerHeight
                } else {
                    mainDimension = availableInnerHeight
                    crossDimension = availableInnerWidth
                }
                child.setPosition(
                    direction: childDirection,
                    mainSize: mainDimension,
                    crossSize: crossDimension,
                    ownerWidth: availableInnerWidth)
            }
            
            if child.style.positionType == .absolute {
                continue
            }
            if child === singleFlexChild {
                child.layout.computedFlexBasisGeneration = context.gCurrentGenerationCount
                child.layout.computedFlexBasis = 0.0
            } else {
                self.computeFlexBasisForChild(
                    child: child,
                    width: availableInnerWidth,
                    widthMode: widthMeasureMode,
                    height: availableInnerHeight,
                    ownerWidth: availableInnerWidth,
                    ownerHeight: availableInnerHeight,
                    heightMode: heightMeasureMode,
                    direction: direction,
                    config: config,
                    context: context)
            }
            
            let addition = (child.layout.computedFlexBasis ?? 0.0) +
                child.getMarginForAxis(
                    axis: mainAxis, widthSize: availableInnerWidth)
            totalOuterFlexBasis += addition
        }
        
        return totalOuterFlexBasis
    }
    
    func zeroOutLayoutRecursivly() -> Void {
        self.layout = LayoutResult()
        self.layout.dimensions = LayoutDimensions(width: 0.0, height: 0.0)
        self.hasNewLayout = true
        self.cloneChildrenIfNeeded()
        _children.forEach({$0.zeroOutLayoutRecursivly()})
    }
    
    func computeFlexBasisForChild(
        child: FlexNode,
        width: Float,
        widthMode: MeasureMode,
        height: Float,
        ownerWidth: Float,
        ownerHeight: Float,
        heightMode: MeasureMode,
        direction: Direction,
        config: Config,
        context: ProcessingContext
        ) -> Void
    {
        let mainAxis: FlexDirection = self.style.flexDirection.resolve(
            direction: direction)
        let isMainAxisRow: Bool = mainAxis.isRow
        let mainAxisSize: Float?
        if isMainAxisRow {
            mainAxisSize = width
        } else {
            mainAxisSize = height
        }
        let mainAxisOwnerSize: Float
        if isMainAxisRow {
            mainAxisOwnerSize = ownerWidth
        } else {
            mainAxisOwnerSize = ownerHeight
        }
        
        var childWidth: Float? = nil
        var childHeight: Float? = nil
        
        var childWidthMeasureMode: MeasureMode = .undefined
        var childHeightMeasureMode: MeasureMode = .undefined
        
        let resolvedFlexBasis: Float? = child.resolveFlexBasisPtr().resolve(
            size: mainAxisOwnerSize)
        let isRowStyleDimensionDefined: Bool = child.isStyleDimDefined(
            for: .row, ownerSize: ownerWidth)
        let isColumnStyleDimensionDefined: Bool = child.isStyleDimDefined(
            for: .column, ownerSize: ownerHeight)
        
        if
            resolvedFlexBasis != nil,
            mainAxisSize != nil//,
//            mainAxisSize != Float.greatestFiniteMagnitude,
//            mainAxisSize != Float.infinity,
//            resolvedFlexBasis != Float.greatestFiniteMagnitude,
//            resolvedFlexBasis != Float.infinity
        {
            if
                child.layout.computedFlexBasis == nil || child.layout.computedFlexBasis == 0.0 ||
                    (child.layout.computedFlexBasisGeneration !=
                        context.gCurrentGenerationCount)
            {
                let paddingAndBorder: Float = child.getPaddingAndBorderForAxis(
                    axis: mainAxis, widthSize: ownerWidth)
                child.layout.computedFlexBasis = max(resolvedFlexBasis, paddingAndBorder)
            }
        } else if isMainAxisRow, isRowStyleDimensionDefined {
            // The width is definite, so use that as the flex basis.
            let paddingAndBorder = child.getPaddingAndBorderForAxis(
                axis: .row, widthSize: ownerWidth)
            let resolved = child.resolvedDimensions.width.resolve(
                size: ownerWidth)
            child.layout.computedFlexBasis = max(resolved, paddingAndBorder)
        } else if !isMainAxisRow, isColumnStyleDimensionDefined {
            // The height is definite, so use that as the flex basis.
            let paddingAndBorder: Float = child.getPaddingAndBorderForAxis(
                axis: .column, widthSize: ownerWidth)
            child.layout.computedFlexBasis = max(
                child.resolvedDimensions.height.resolve(size: ownerHeight),
                paddingAndBorder)
        } else {
            // Compute the flex basis and hypothetical main size (i.e. the clamped
            // flex basis).
            childWidth = nil
            childHeight = nil
            childWidthMeasureMode = .undefined
            childHeightMeasureMode = .undefined
            
            let marginRow = child.getMarginForAxis(
                axis: .row, widthSize: ownerWidth)
            let marginColumn = child.getMarginForAxis(
                axis: .column, widthSize: ownerWidth)
            
            if isRowStyleDimensionDefined {
                childWidth = child.resolvedDimensions.width.resolve(
                    size: ownerWidth) + marginRow
                childWidthMeasureMode = .exactly
            }
            
            if isColumnStyleDimensionDefined {
                childHeight = child.resolvedDimensions.height.resolve(size: ownerHeight) + marginColumn
                childHeightMeasureMode = .exactly
            }
            
            // The W3C spec doesn't say anything about the 'overflow' property,
            // but all major browsers appear to implement the following logic.
            if
                (!isMainAxisRow && self.style.overflow == .scroll) ||
                    self.style.overflow != .scroll
            {
                if childWidth == nil {
                    childWidth = width
                    childWidthMeasureMode = .atMost
                }
            }
                
            if
                isMainAxisRow && self.style.overflow == .scroll ||
                    self.style.overflow != .scroll
            {
                if childHeight == nil {
                    childHeight = height
                    childHeightMeasureMode = .atMost
                }
            }
            
            if let aspectRatio = child.style.aspectRatio  {
                if
                    !isMainAxisRow,
                    childWidthMeasureMode == .exactly
                {
                    childHeight = marginColumn + (childWidth - marginRow) / aspectRatio
                    childHeightMeasureMode = .exactly
                } else if
                    isMainAxisRow,
                    childHeightMeasureMode == .exactly
                {
                    childWidth = marginRow + (childHeight - marginColumn) * aspectRatio
                    childWidthMeasureMode = .exactly
                }
            }
            
            // If child has no defined size in the cross axis and is set to stretch,
            // set the cross
            // axis to be measured exactly with the available inner width

            let hasExactWidth: Bool = widthMode == .exactly
            let childWidthStretch: Bool = self.alignItems(
                child: child) == .stretch &&
                childWidthMeasureMode != .exactly
            if
                !isMainAxisRow,
                !isRowStyleDimensionDefined,
                hasExactWidth, childWidthStretch
            {
                childWidth = width
                childWidthMeasureMode = .exactly
                if let aspectRatio =  child.style.aspectRatio {
                    childHeight = (childWidth - marginRow) / aspectRatio
                    childHeightMeasureMode = .exactly
                }
            }
            
            let hasExactHeight: Bool = heightMode == .exactly
            let childHeightStretch = alignItems(
                child: child) == .stretch &&
                childHeightMeasureMode != .exactly
            if
                isMainAxisRow,
                !isColumnStyleDimensionDefined,
                hasExactHeight,
                childHeightStretch
            {
                childHeight = height
                childHeightMeasureMode = .exactly
                
                if let aspectRatio = child.style.aspectRatio {
                    childWidth = (childHeight - marginColumn) * aspectRatio
                    childHeightMeasureMode = .exactly
                }
            }
            
            constrainMax(
                axis: .row,
                ownerAxisSize: ownerWidth,
                ownerWidth: ownerWidth,
                mode: &childWidthMeasureMode,
                size: &childWidth)
            
            constrainMax(
                axis: .column,
                ownerAxisSize: ownerHeight,
                ownerWidth: ownerWidth,
                mode: &childHeightMeasureMode,
                size: &childHeight)
                
            child.performLayoutIfNeeded(
                availableWidth: childWidth,
                availableHeight: childHeight,
                widthMeasureMode: childWidthMeasureMode,
                heightMeasureMode: childHeightMeasureMode,
                ownerWidth: ownerWidth,
                ownerHeight: ownerHeight,
                ownerDirection: direction,
                shouldPerformFullLayout: false,
                reason: "measure",
                config: config,
                context: context)
                
            child.layout.computedFlexBasis = max(
                child.layout.measuredDimensions[mainAxis.dimension],
                child.getPaddingAndBorderForAxis(
                    axis: mainAxis, widthSize: ownerWidth)
            )
        }
        child.layout.computedFlexBasisGeneration = context.gCurrentGenerationCount
    }
    
    func alignItems(child: FlexNode) -> Align {
        let align: Align
        if child.style.alignSelf == .auto {
            align = self.style.alignItems
        } else {
            align = child.style.alignSelf
        }
        if align == .baseline, self.style.flexDirection.isColumn {
            return .flexStart
        }
        return align
    }
    
    func constrainMax(
        axis: FlexDirection,
        ownerAxisSize: Float,
        ownerWidth: Float,
        mode: inout MeasureMode,
        size: inout Float?
        ) -> Void
    {
        let maxSize: Float? = self.style.max[axis.dimension].resolve(
            size: ownerAxisSize) + self.getMarginForAxis(
                axis: axis, widthSize: ownerWidth)
        switch mode {
        case .undefined:
            if let maxSize = maxSize {
                mode = .atMost
                size = maxSize
            }
        case .exactly: fallthrough
        case .atMost:
            if
                let maxSize = maxSize,
                size >= maxSize
            {
                size = maxSize
            }
        }
    }
    
    /// This function assumes that all the children of node have their
    /// computedFlexBasis properly computed(To do this use
    /// YGNodeComputeFlexBasisForChildren function).
    /// This function calculates YGCollectFlexItemsRowMeasurement
    func calculateCollectFlexItemsRowValues(
        ownerDirection: Direction,
        mainAxisOwnerSize: Float?,
        availableInnerWidth: Float,
        availableInnerMainDimension: Float,
        startOfLineIndex: Int,
        lineCount: Int
        ) -> CollectFlexItemsRowValues<T>
    {
        var flexAlgoRowMeasurement: CollectFlexItemsRowValues<T> = .init()
        var sizeConsumedOnCurrentLineIncludingMinConstraint: Float = 0
        let mainAxis: FlexDirection = self.style.flexDirection.resolve(
            direction: self.resolveDirection(ownerDirection: ownerDirection))
        let isNodeFlexWrap: Bool = self.style.flexWrap != .noWrap
        
        // Add items to the current line until it's full or we run out of items.
        var endOfLineIndex: Int = startOfLineIndex;
        while endOfLineIndex < self._children.count {
            let child: FlexNode = self._children[endOfLineIndex]
            if
                child.style.display == .none ||
                    child.style.positionType == .absolute
            {
                endOfLineIndex += 1
                continue
            }
            child.layout.lineIndex = lineCount
            let childMarginMainAxis: Float = child.getMarginForAxis(
                axis: mainAxis, widthSize: availableInnerWidth)
            
            let _flexBasisWithMinAndMaxConstraints: Float = child
                .boundAxisWithinMinAndMax(
                    axis: mainAxis,
                    value: child.layout.computedFlexBasis,
                    axisSize: mainAxisOwnerSize) ?? 0.0
            let flexBasisWithMinAndMaxConstraints: Float = (_flexBasisWithMinAndMaxConstraints == Float.infinity || _flexBasisWithMinAndMaxConstraints ~= Float.greatestFiniteMagnitude) ? 0.0 : _flexBasisWithMinAndMaxConstraints
            
            // If this is a multi-line flow and this item pushes us over the
            // available size, we've
            // hit the end of the current line. Break out of the loop and lay
            // out the current line.
            if (sizeConsumedOnCurrentLineIncludingMinConstraint +
                flexBasisWithMinAndMaxConstraints + childMarginMainAxis >
                availableInnerMainDimension &&
                isNodeFlexWrap && flexAlgoRowMeasurement.itemsOnLine > 0)
            {
                break;
            }
            
            sizeConsumedOnCurrentLineIncludingMinConstraint +=
                flexBasisWithMinAndMaxConstraints + childMarginMainAxis
            flexAlgoRowMeasurement.sizeConsumedOnCurrentLine +=
                Int(flexBasisWithMinAndMaxConstraints + childMarginMainAxis)
            flexAlgoRowMeasurement.itemsOnLine += 1
            
            if child.isNodeFlexible {
                flexAlgoRowMeasurement.totalFlexGrowFactors += child
                    .resolveFlexGrow()
                
                // Unlike the grow factor, the shrink factor is scaled relative
                // to the child dimension.
                flexAlgoRowMeasurement.totalFlexShrinkScaledFactors +=
                    -child.resolveFlexShrink() *
                    (child.layout.computedFlexBasis ?? 0.0)
            }
            
            flexAlgoRowMeasurement.relativeChildren.append(child)
            // END
            endOfLineIndex += 1
        }
        
        if  // The total flex factor needs to be floored to 1.
            flexAlgoRowMeasurement.totalFlexGrowFactors > 0.0,
            flexAlgoRowMeasurement.totalFlexGrowFactors < 1.0
        {
            flexAlgoRowMeasurement.totalFlexGrowFactors = 1.0
        }
        
        if  // The total flex shrink factor needs to be floored to 1.
            flexAlgoRowMeasurement.totalFlexShrinkScaledFactors > 0,
            flexAlgoRowMeasurement.totalFlexShrinkScaledFactors < 1
        {
            flexAlgoRowMeasurement.totalFlexShrinkScaledFactors = 1
        }
        
        flexAlgoRowMeasurement.endOfLineIndex = endOfLineIndex
        return flexAlgoRowMeasurement
    }
    
    /// Do two passes over the flex items to figure out how to distribute the
    /// remaining space.
    /// The first pass finds the items whose min/max constraints trigger,
    /// freezes them at those
    /// sizes, and excludes those sizes from the remaining space. The second
    /// pass sets the size
    /// of each flexible item. It distributes the remaining space amongst the
    /// items whose min/max
    /// constraints didn't trigger in pass 1. For the other items, it sets
    /// their sizes by forcing
    /// their min/max constraints to trigger again.
    ///
    /// This two pass approach for resolving min/max constraints deviates from
    /// the spec. The
    /// spec (https://www.w3.org/TR/YG-flexbox-1/#resolve-flexible-lengths)
    /// describes a process
    /// that needs to be repeated a variable number of times. The algorithm
    /// implemented here
    /// won't handle all cases but it was simpler to implement and it mitigates
    /// performance
    /// concerns because we know exactly how many passes it'll do.
    ///
    /// At the end of this function the child nodes would have the proper size
    /// assigned to them.
    ///
    func resolveFlexibleLength(
        collectedFlexItemsValues: inout CollectFlexItemsRowValues<T>,
        mainAxis: FlexDirection,
        crossAxis: FlexDirection,
        mainAxisownerSize: Float?,
        availableInnerMainDim: Float,
        availableInnerCrossDim: Float,
        availableInnerWidth: Float,
        availableInnerHeight: Float,
        flexBasisOverflows: Bool,
        measureModeCrossDim: MeasureMode,
        shouldPerformFullLayout: Bool,
        config: Config,
        context: ProcessingContext
        ) -> Void
    {
        let originalFreeSpace = collectedFlexItemsValues.remainingFreeSpace
        // First pass: detect the flex items whose min/max constraints trigger
        collectedFlexItemsValues.distributeFreeSpaceFirstPass(
            mainAxis: mainAxis,
            mainAxisOwnerSize: mainAxisownerSize,
            availableInnerMainDim: availableInnerMainDim,
            availableInnerWidth: availableInnerWidth)
        
        // Second pass: resolve the sizes of the flexible items
        let distributedFreeSpace: Float = collectedFlexItemsValues
            .distributeFreeSpaceSecondPass(
                node: self,
                mainAxis: mainAxis,
                crossAxis: crossAxis,
                mainAxisOwnerSize: mainAxisownerSize,
                availableInnerMainDim: availableInnerMainDim,
                availableInnerCrossDim: availableInnerCrossDim,
                availableInnerWidth: availableInnerWidth,
                availableInnerHeight: availableInnerHeight,
                flexBasisOverflows: flexBasisOverflows,
                measureModeCrossDim: measureModeCrossDim,
                shouldPerformFullLayout: shouldPerformFullLayout,
                config: config,
                context: context)
        
        collectedFlexItemsValues.remainingFreeSpace = originalFreeSpace - distributedFreeSpace
    }
    
    func justifyMainAxis(
        collectedFlexItemsValues: inout CollectFlexItemsRowValues<T>,
        startOfLineIndex: Int,
        mainAxis: FlexDirection,
        crossAxis: FlexDirection,
        measureModeMainDim: MeasureMode,
        measureModeCrossDim: MeasureMode,
        mainAxisownerSize: Float?,
        ownerWidth: Float?,
        availableInnerMainDim: Float,
        availableInnerCrossDim: Float,
        availableInnerWidth: Float,
        shouldPerformFullLayout: Bool,
        processingContext: ProcessingContext
        ) -> Void
    {
        let leadingPaddingAndBorderMain: Float = self.getLeadingPaddingAndBorder(
            axis: mainAxis,
            widthSize: ownerWidth)
        
        let trailingPaddingAndBorderMain: Float = self.getTrailingPaddingAndBorder(
            axis: mainAxis,
            widthSize: ownerWidth)
        
        // If we are using "at most" rules in the main axis, make sure that
        // remainingFreeSpace is 0 when min main dimension is not given
        if
            measureModeMainDim == .atMost,
            collectedFlexItemsValues.remainingFreeSpace > 0
        {
            if
                style.min[mainAxis.dimension].unit != .undefined,
                let resolved = style.min[mainAxis.dimension].resolve(size: mainAxisownerSize)
            {
                // This condition makes sure that if the size of main dimension(after
                // considering child nodes main dim, leading and trailing padding etc)
                // falls below min dimension, then the remainingFreeSpace is reassigned
                // considering the min dimension
                
                // `minAvailableMainDim` denotes minimum available space in which child
                // can be laid out, it will exclude space consumed by padding and border.
                let minAvailableMainDim = resolved -
                    leadingPaddingAndBorderMain - trailingPaddingAndBorderMain
                let occupiedSpaceByChildNodes: Float = availableInnerMainDim - collectedFlexItemsValues.remainingFreeSpace
                collectedFlexItemsValues.remainingFreeSpace = max(
                    0.0,
                    minAvailableMainDim - occupiedSpaceByChildNodes
                )
            } else {
                collectedFlexItemsValues.remainingFreeSpace = 0.0
            }
        }
        
        var numberOfAutoMarginsOnCurrentLine = 0
        for i in startOfLineIndex..<collectedFlexItemsValues.endOfLineIndex {
            let child: FlexNode = self._children[i]
            if child.style.positionType == .relative {
                if child.marginLeadingValue(axis: mainAxis).unit == .auto {
                    numberOfAutoMarginsOnCurrentLine += 1
                }
                if child.marginTrailingValue(axis: mainAxis).unit == .auto {
                    numberOfAutoMarginsOnCurrentLine += 1
                }
            }
        }
            
        // In order to position the elements in the main axis, we have two
        // controls. The space between the beginning and the first element
        // and the space between each two elements.
        var leadingMainDim: Float = 0.0
        var betweenMainDim: Float = 0.0
        
        let justifyContent: Justify = self.style.justifyContent
        
        if numberOfAutoMarginsOnCurrentLine == 0 {
            switch justifyContent {
            case .center:
                leadingMainDim = collectedFlexItemsValues.remainingFreeSpace * 0.5
            case .flexEnd:
                leadingMainDim = collectedFlexItemsValues.remainingFreeSpace
            case .spaceBetween:
                if collectedFlexItemsValues.itemsOnLine > 1 {
                    betweenMainDim = max(collectedFlexItemsValues.remainingFreeSpace, 0.0) / Float(collectedFlexItemsValues.itemsOnLine - 1)
                } else {
                    betweenMainDim = 0.0
                }
            case .spaceEvenly:
                // Space is distributed evenly across all elements
                betweenMainDim = collectedFlexItemsValues.remainingFreeSpace /
                    Float(collectedFlexItemsValues.itemsOnLine + 1)
                leadingMainDim = betweenMainDim;
            case .spaceAround:
                // Space on the edges is half of the space between elements
                betweenMainDim = collectedFlexItemsValues.remainingFreeSpace /
                    Float(collectedFlexItemsValues.itemsOnLine)
                leadingMainDim = betweenMainDim * 0.5
            case .flexStart:
                break
            }
        }
            
        collectedFlexItemsValues.mainDim =
            leadingPaddingAndBorderMain + leadingMainDim
        collectedFlexItemsValues.crossDim = 0.0
        
        var maxAscentForCurrentLine: Float = 0.0
        var maxDescentForCurrentLine: Float = 0.0
        let isNodeBaselineLayout: Bool = self.isBaselineLayout

        for i in startOfLineIndex..<collectedFlexItemsValues.endOfLineIndex {
            let child = self._children[i]
            guard child.style.display != .none else { continue }
            if
                child.style.positionType == .absolute,
                child.isLeadingPositionDefined(forAxis: mainAxis)
            {
                if shouldPerformFullLayout {
                    // In case the child is position absolute and has left/top being
                    // defined, we override the position to whatever the user said
                    // (and margin/border).
                    child.layout.position[mainAxis] = (child.getLeadingPosition(
                        axis: mainAxis,
                        axisSize: availableInnerMainDim) ?? 0.0) + self.getLeadingBorder(
                            axis: mainAxis) + child.getLeadingMargin(
                                axis: mainAxis,
                                widthSize: availableInnerWidth)
                }
            } else {
                // Now that we placed the element, we need to update the variables.
                // We need to do that only for relative elements. Absolute elements
                // do not take part in that phase.
                if child.style.positionType == .relative {
                    if child.marginLeadingValue(axis: mainAxis).unit == .auto {
                        collectedFlexItemsValues.mainDim += collectedFlexItemsValues.remainingFreeSpace / Float(numberOfAutoMarginsOnCurrentLine)
                    }
                    
                    if shouldPerformFullLayout {
                        child.layout.position[mainAxis] += collectedFlexItemsValues.mainDim
                    }
                    
                    if child.marginTrailingValue(axis: mainAxis).unit == .auto {
                        collectedFlexItemsValues.mainDim += collectedFlexItemsValues.remainingFreeSpace / Float(numberOfAutoMarginsOnCurrentLine)
                    }
                    
                    if
                        !shouldPerformFullLayout,
                        measureModeCrossDim == .exactly
                    {
                        // If we skipped the flex step, then we can't rely on the
                        // measuredDims because
                        // they weren't computed. This means we can't call
                        // YGNodeDimWithMargin.
                        collectedFlexItemsValues.mainDim += betweenMainDim + child.getMarginForAxis(axis: mainAxis, widthSize: availableInnerWidth) + (child.layout.computedFlexBasis ?? 0.0)
                        collectedFlexItemsValues.crossDim = availableInnerCrossDim
                    } else {
                        // The main dimension is the sum of all the elements dimension plus
                        // the spacing.
                        collectedFlexItemsValues.mainDim += betweenMainDim +
                            child.dimensionWithMargin(
                                axis: mainAxis,
                                widthSize: availableInnerWidth)
                        
                        if isNodeBaselineLayout {
                            // If the child is baseline aligned then the cross dimension is
                            // calculated by adding maxAscent and maxDescent from the baseline.
                            let ascent: Float = child.getBaseline(processingContext: processingContext) + child.getLeadingMargin(
                                axis: .column,
                                widthSize: availableInnerWidth)
                            
                            let descent = child.layout.measuredDimensions.height + child.getMarginForAxis(
                                axis: .column, widthSize: availableInnerWidth) - ascent
                            
                            maxAscentForCurrentLine = max(maxAscentForCurrentLine, ascent)
                            maxDescentForCurrentLine = max(maxDescentForCurrentLine, descent)
                        } else {
                            // The cross dimension is the max of the elements dimension since
                            // there can only be one element in that cross dimension in the case
                            // when the items are not baseline aligned
                            collectedFlexItemsValues.crossDim = max(
                                collectedFlexItemsValues.crossDim,
                                child.dimensionWithMargin(
                                    axis: crossAxis,
                                    widthSize: availableInnerWidth)
                            )
                        }
                    }
                } else if shouldPerformFullLayout {
                    child.layout.position[mainAxis] += self.getLeadingBorder(
                        axis: mainAxis) + leadingMainDim
                }
            }
        } // end loop
        
        collectedFlexItemsValues.mainDim += trailingPaddingAndBorderMain
        
        if isNodeBaselineLayout {
            collectedFlexItemsValues.crossDim = maxAscentForCurrentLine + maxDescentForCurrentLine
        }
        
    }
    
    var isBaselineLayout: Bool {
        if style.flexDirection.isColumn {
            return false
        }
        
        if style.alignItems == .baseline {
            return true
        }
        
        for child in _children {
            if
                child.style.positionType == .relative,
                child.style.alignSelf == .baseline
            {
                return true
            }
        }
        
        return false
    }
    
    func dimensionWithMargin(
        axis: FlexDirection,
        widthSize: Float
        ) -> Float
    {
        let a = self.layout.measuredDimensions[axis.dimension]
        let b = self.getLeadingMargin(axis: axis, widthSize: widthSize)
        let c = self.getTrailingMargin(axis: axis, widthSize: widthSize)
        return a + b + c
    }
    
    func isLayoutDimensionDefined(for axis: FlexDirection) -> Bool {
        let value: Float = self.layout.measuredDimensions[axis.dimension]
        return value >= 0.0
    }
    
    func getBaseline(processingContext: ProcessingContext) -> Float {
        
        if let baselineFunc: BaselineHelper = processingContext[self.nodeType] {
            let baseline: Float = baselineFunc.baseline(task: BaselineTask(
                node: self,
                width: self.layout.measuredDimensions.width,
                height: self.layout.measuredDimensions.height))
            return baseline
        }
        
        var _baselineChild: FlexNode? = nil
        for child in _children {
            guard child.layout.lineIndex <= 0 else { break }
            guard child.style.positionType != .absolute else { continue }
            if
                self.alignItems(child: child) == .baseline ||
                    child.isReferenceBaseline
            {
                _baselineChild = child
                break
            }
            
            if _baselineChild == nil {
                _baselineChild = child
            }
        }
        
        guard let baselineChild = _baselineChild else {
            return self.layout.measuredDimensions.height
        }
        
        let baseline: Float = baselineChild.getBaseline(processingContext: processingContext)
        return baseline + baselineChild.layout.position.top
    }
}

/// This struct is an helper model to hold the data for step 4 of flexbox
/// algo, which is collecting the flex items in a line.
///
/// - itemsOnLine: Number of items which can fit in a line considering the
/// available Inner dimension, the flex items computed flexbasis and their
/// margin. It may be different than the difference between start and end
/// indicates because we skip over absolute-positioned items.
///
/// - sizeConsumedOnCurrentLine: It is accumulation of the dimensions and
/// margin of all the children on the current line. This will be used in order
/// to either set the dimensions of the node if none already exist or to
/// compute the remaining space left for the flexible children.
///
/// - totalFlexGrowFactors: total flex grow factors of flex items which are to
/// be layed in the current line
///
/// - totalFlexShrinkFactors: total flex shrink factors of flex items which are
/// to be layed in the current line
///
/// - endOfLineIndex: Its the end index of the last flex item which was
/// examined and it may or may not be part of the current line(as it may be
/// absolutely positioned or inculding it may have caused to overshoot
/// availableInnerDim)
///
/// - relativeChildren: Maintain a vector of the child nodes that can shrink
/// and/or grow.
struct CollectFlexItemsRowValues<T: FlexElement> {
    var itemsOnLine: Int
    var sizeConsumedOnCurrentLine: Int
    var totalFlexGrowFactors: Float
    var totalFlexShrinkScaledFactors: Float
    var endOfLineIndex: Int
    var relativeChildren: [FlexNode<T>]
    var remainingFreeSpace: Float
    // The size of the mainDim for the row after considering size, padding, margin
    // and border of flex items. This is used to calculate maxLineDim after going
    // through all the rows to decide on the main axis size of owner.
    var mainDim: Float
    // The size of the crossDim for the row after considering size, padding,
    // margin and border of flex items. Used for calculating containers crossSize.
    var crossDim: Float
    
    init() {
        self.itemsOnLine = 0
        self.sizeConsumedOnCurrentLine = 0
        self.totalFlexGrowFactors = 0.0
        self.totalFlexShrinkScaledFactors = 0.0
        self.endOfLineIndex = 0
        self.relativeChildren = []
        self.remainingFreeSpace = 0.0
        self.mainDim = 0.0
        self.crossDim = 0.0
    }
    
    mutating func distributeFreeSpaceFirstPass(
        mainAxis: FlexDirection,
        mainAxisOwnerSize: Float?,
        availableInnerMainDim: Float,
        availableInnerWidth: Float)
    {
        var flexShrinkScaledFactor: Float? = 0.0
        var flexGrowFactor: Float = 0.0
        var baseMainSize: Float? = 0.0
        var boundMainSize: Float = 0.0
        var deltaFreeSpace: Float = 0.0
        
        for currentRelativeChild in self.relativeChildren {
            // guard // TODO: WARN?
                let childFlexBasis = currentRelativeChild.boundAxisWithinMinAndMax(
                    axis: mainAxis,
                    value: currentRelativeChild.layout.computedFlexBasis,
                    axisSize: mainAxisOwnerSize)
            // else { return }
            
            if remainingFreeSpace < 0.0 {
                flexShrinkScaledFactor =
                    -currentRelativeChild.resolveFlexShrink() * childFlexBasis
                // Is this child able to shrink?
                if
                    let flexShrinkScaledFactor = flexShrinkScaledFactor,
                    flexShrinkScaledFactor != 0.0
                {
                    baseMainSize = childFlexBasis + self.remainingFreeSpace / self.totalFlexShrinkScaledFactors * flexShrinkScaledFactor
                    boundMainSize = currentRelativeChild.boundAxis(
                        axis: mainAxis,
                        value: baseMainSize,
                        axisSize: availableInnerMainDim,
                        widthSize: availableInnerWidth)
                    if
                        let base = baseMainSize,
                        base != boundMainSize
                    {
                        // By excluding this item's size and flex factor from
                        // remaining, this item's min/max constraints should
                        // also trigger in the second pass resulting in the
                        // item's size calculation being identical in the first
                        // and second passes.
                        deltaFreeSpace += boundMainSize - (childFlexBasis ?? 0.0)
                        self.totalFlexShrinkScaledFactors -= flexShrinkScaledFactor
                    }
                }
                
            } else if remainingFreeSpace > 0.0 {
                flexGrowFactor = currentRelativeChild.resolveFlexGrow()
                
                // Is this child able to grow?
                if flexGrowFactor != 0.0 {
                    let rightSide = self.remainingFreeSpace /
                        self.totalFlexGrowFactors * flexGrowFactor
                    baseMainSize = childFlexBasis + rightSide
                    
                    boundMainSize = currentRelativeChild.boundAxis(
                        axis: mainAxis,
                        value: baseMainSize,
                        axisSize: availableInnerMainDim,
                        widthSize: availableInnerWidth)
                    
                    if
                        let baseMainSize = baseMainSize,
                        baseMainSize != boundMainSize
                    {
                        // By excluding this item's size and flex factor from
                        // remaining, this item's min/max constraints should
                        // also trigger in the second pass resulting in the
                        // item's size calculation being identical in the first
                        // and second passes.
                        deltaFreeSpace += boundMainSize - (childFlexBasis ?? 0.0)
                        self.totalFlexGrowFactors -= flexGrowFactor;
                    }
                }
            }
        }
        self.remainingFreeSpace -= deltaFreeSpace
    }
    
    func distributeFreeSpaceSecondPass(
        node: FlexNode<T>,
        mainAxis: FlexDirection,
        crossAxis: FlexDirection,
        mainAxisOwnerSize: Float?,
        availableInnerMainDim: Float,
        availableInnerCrossDim: Float,
        availableInnerWidth: Float,
        availableInnerHeight: Float,
        flexBasisOverflows: Bool,
        measureModeCrossDim: MeasureMode,
        shouldPerformFullLayout: Bool,
        config: Config,
        context: ProcessingContext
        ) -> Float
    {
        var childFlexBasis: Float = 0.0
        var flexShrinkScaledFactor: Float = 0.0
        var flexGrowFactor: Float = 0.0
        var deltaFreeSpace: Float = 0.0
        let isMainAxisRow: Bool = mainAxis.isRow
        let isNodeFlexWrap: Bool = node.style.flexWrap != .noWrap
        
        for currentRelativeChild in self.relativeChildren {
            childFlexBasis = currentRelativeChild.boundAxisWithinMinAndMax(
                axis: mainAxis,
                value: currentRelativeChild.layout.computedFlexBasis,
                axisSize: mainAxisOwnerSize) ?? 0.0
            
            var updatedMainSize = childFlexBasis
            
            if
                self.remainingFreeSpace < 0.0
            {
                flexShrinkScaledFactor = -currentRelativeChild
                    .resolveFlexShrink() * childFlexBasis
                // Is this child able to shrink?
                if flexShrinkScaledFactor != 0.0 {
                    let childSize: Float
                    let totalFlexShrinkScaledFactors =
                        self.totalFlexShrinkScaledFactors
                    if
                        totalFlexShrinkScaledFactors == 0.0
                    {
                        childSize = childFlexBasis + flexShrinkScaledFactor
                    } else {
                        childSize = childFlexBasis +
                            (remainingFreeSpace /
                                totalFlexShrinkScaledFactors) *
                        flexShrinkScaledFactor
                    }
                    
                    updatedMainSize = currentRelativeChild.boundAxis(
                        axis: mainAxis,
                        value: childSize,
                        axisSize: availableInnerMainDim,
                        widthSize: availableInnerWidth)
                }
            } else if
                self.remainingFreeSpace > 0.0
            {
                flexGrowFactor = currentRelativeChild.resolveFlexGrow()
                
                // Is this child able to grow?
                if flexGrowFactor != 0.0 {
                    updatedMainSize = currentRelativeChild.boundAxis(
                        axis: mainAxis,
                        value: childFlexBasis + (self.remainingFreeSpace /
                            self.totalFlexGrowFactors * flexGrowFactor),
                        axisSize: availableInnerMainDim,
                        widthSize: availableInnerWidth)
                }
            }
            
            deltaFreeSpace += updatedMainSize - childFlexBasis
            
            let marginMain: Float = currentRelativeChild.getMarginForAxis(
                axis: mainAxis, widthSize: availableInnerWidth)
            let marginCross: Float = currentRelativeChild.getMarginForAxis(
                axis: crossAxis, widthSize: availableInnerWidth)
            
            var childCrossSize: Float? = 0.0
            var childMainSize: Float? = updatedMainSize + marginMain
            var childCrossMeasureMode: MeasureMode
            var childMainMeasureMode: MeasureMode = .exactly;
            
            if
                let aspectRatio = currentRelativeChild.style.aspectRatio
            {
                if isMainAxisRow {
                    childCrossSize = ((childMainSize ?? 0.0) - marginMain) / aspectRatio
                } else {
                    childCrossSize = ((childMainSize ?? 0.0) - marginMain) * aspectRatio
                }
                childCrossMeasureMode = .exactly
                childCrossSize = (childCrossSize ?? 0.0) + marginCross
            } else if
                !currentRelativeChild.isStyleDimDefined(
                    for: crossAxis, ownerSize: availableInnerCrossDim),
                measureModeCrossDim == .exactly,
                !(isNodeFlexWrap && flexBasisOverflows),
                node.alignItems(child: currentRelativeChild) == .stretch,
                currentRelativeChild.marginLeadingValue(axis: crossAxis) != .auto,
                currentRelativeChild.marginTrailingValue(axis: crossAxis) != .auto
            {
                childCrossSize = availableInnerCrossDim
                childCrossMeasureMode = .exactly
            } else if
                !currentRelativeChild.isStyleDimDefined(
                    for: crossAxis,
                    ownerSize: availableInnerCrossDim)
            {
                childCrossSize = availableInnerCrossDim
                childCrossMeasureMode = .atMost
            } else {
                childCrossSize = (currentRelativeChild
                    .resolvedDimensions[crossAxis.dimension].resolve(
                        size: availableInnerCrossDim) ?? 0.0) + marginCross
                
                let isLoosePercentageMeasurement: Bool = currentRelativeChild
                    .resolvedDimensions[crossAxis.dimension].unit == .percent &&
                    measureModeCrossDim != .exactly
                
                if isLoosePercentageMeasurement {
                    childCrossMeasureMode = .undefined
                } else {
                    childCrossMeasureMode = .exactly
                }
            }
            
            currentRelativeChild.constrainMax(
                axis: mainAxis,
                ownerAxisSize: availableInnerMainDim,
                ownerWidth: availableInnerWidth,
                mode: &childMainMeasureMode,
                size: &childMainSize)
            
            currentRelativeChild.constrainMax(
                axis: crossAxis,
                ownerAxisSize: availableInnerCrossDim,
                ownerWidth: availableInnerWidth,
                mode: &childCrossMeasureMode,
                size: &childCrossSize)
         
            let requiresStretchLayout: Bool = !currentRelativeChild
                .isStyleDimDefined(
                    for: crossAxis, ownerSize: availableInnerCrossDim) &&
                node.alignItems(child: currentRelativeChild) == .stretch &&
                currentRelativeChild.marginLeadingValue(axis: crossAxis).unit != .auto &&
                currentRelativeChild.marginTrailingValue(axis: crossAxis).unit != .auto
            
            let childWidth: Float? = isMainAxisRow ? childMainSize : childCrossSize
            let childHeight: Float? = !isMainAxisRow ? childMainSize : childCrossSize
            
            let childWidthMeasureMode: MeasureMode = isMainAxisRow ? childMainMeasureMode : childCrossMeasureMode
            let childHeightMeasureMode: MeasureMode =
                !isMainAxisRow ? childMainMeasureMode : childCrossMeasureMode
            
            // Recursively call the layout algorithm for this child with the updated
            // main size.
            currentRelativeChild.performLayoutIfNeeded(
                availableWidth: childWidth,
                availableHeight: childHeight,
                widthMeasureMode: childWidthMeasureMode,
                heightMeasureMode: childHeightMeasureMode,
                ownerWidth: availableInnerWidth,
                ownerHeight: availableInnerHeight,
                ownerDirection: node.layout.direction,
                shouldPerformFullLayout: shouldPerformFullLayout && !requiresStretchLayout,
                reason: "flex",
                config: config,
                context: context)
            
            node.layout.hasOverflow = node.layout.hasOverflow || currentRelativeChild.layout.hasOverflow
        }
        
        return deltaFreeSpace
    }
 
    
}
