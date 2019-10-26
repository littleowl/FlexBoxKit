//
//  MeasureTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/23/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

fileprivate func _measure(
    _ task: MeasureTask,
    _ measureCount: inout Int)
    -> Size
{
    measureCount += 1
    return Size.init(width: 10.0, height: 10.0)
}

fileprivate func _simulateWrappingText(
    _ task: MeasureTask)
    -> Size
{
    if task.widthMode == .undefined || task.width >= 68.0 {
        return Size.init(width: 68.0, height: 16.0)
    }
    return Size.init(width: 50.0, height: 32.0)
}

fileprivate func _measureAssertNegative(
    _ task: MeasureTask)
    -> Size
{
    return Size.init(width: 0.0, height: 0.0)
}

class MeasureTest: XCTestCase {
    
    func testDontMeasureSingleGrowShrinkChild() {
        
        var measureCount: Int = 0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _measure($0, &measureCount) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
//        rootChild0.measureFunc = { _measure($0, &measureCount) }
        rootChild0.nodeType = FlexNodeType.test
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexShrink = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0, measureCount)
        
    }
    
    func testMeasureAbsoluteChildWithNoConstraints() {
        
        var measureCount: Int = 0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _measure($0, &measureCount) })
        
        let root = FlexNode<NoFlexElement>()
        
        let rootChild0 = FlexNode<NoFlexElement>()
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.style.positionType = .absolute
        rootChild0Child0.nodeType = FlexNodeType.test
//        rootChild0Child0.measureFunc = { _measure($0, &measureCount) }
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(1, measureCount)
        
    }
    
    func testDontMeasureWhenMinEqualsMax() {
        
        var measureCount: Int = 0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: {
            return _measure($0, &measureCount)
        })
        
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test//.measureFunc = { _measure($0, &measureCount) }
        rootChild0.style.min.width = 10.0
        rootChild0.style.min.height = 10.0
        rootChild0.style.max.width = 10.0
        rootChild0.style.max.height = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0, measureCount)
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.height, accuracy: 0.00001)
        
    }
    
    func testDontMeasureWhenMinEqualsMaxPercentages() {
        
        var measureCount: Int = 0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: {
            return _measure($0, &measureCount)
        })
        
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test//.measureFunc = { _measure($0, &measureCount) }
        rootChild0.style.min.width = .percent(10.0)
        rootChild0.style.min.height = .percent(10.0)
        rootChild0.style.max.width = .percent(10.0)
        rootChild0.style.max.height = .percent(10.0)
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0, measureCount)
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureNodesWithMarginQutoAndStretch() {
        
        var measureCount: Int = 0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _measure($0, &measureCount) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.width = 500.0
        root.style.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test
        //rootChild0.measureFunc = { _measure($0, &measureCount) }
        rootChild0.style.margin.left = .auto
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(490.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.height, accuracy: 0.00001)
        
    }
    
    func testDontMeasureWhenMinEqualsMaxMixedWidthPercent() {
        
        var measureCount: Int = 0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _measure($0, &measureCount) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test
//        rootChild0.measureFunc = { _measure($0, &measureCount) }
        rootChild0.style.min.width = .percent(10.0)
        rootChild0.style.max.width = .percent(10.0)
        rootChild0.style.min.height = 10.0
        rootChild0.style.max.height = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0, measureCount)
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.height, accuracy: 0.00001)
        
    }
    
    func testDontMeasureWhenMinEqualsMaxMixedHeightPercent() {
        
        var measureCount: Int = 0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _measure($0, &measureCount) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test
//        rootChild0.measureFunc = { _measure($0, &measureCount) }
        rootChild0.style.min.width = 10.0
        rootChild0.style.max.width = 10.0
        rootChild0.style.min.height = .percent(10.0)
        rootChild0.style.max.height = .percent(10.0)
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0, measureCount)
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureEnoughSizeShouldBeInSingleLine() {
        
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _simulateWrappingText($0) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test
//        rootChild0.measureFunc = { _simulateWrappingText($0) }
        rootChild0.style.alignSelf = .flexStart
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(68.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(16.0, rootChild0.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureNotEnoughSizeShouldWrap() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _simulateWrappingText($0) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test
//        rootChild0.measureFunc = { _simulateWrappingText($0) }
        rootChild0.style.alignSelf = .flexStart
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(68.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(16.0, rootChild0.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureZeroSpaceShouldGrow() {
        
        var measureCount: Int = 0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _measure($0, &measureCount) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.height = 200.0
        root.style.flexGrow = 0.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.flexDirection = .column
        rootChild0.style.padding.all = 100.0
//        rootChild0.measureFunc = { _measure($0, &measureCount) }
        rootChild0.nodeType = .test
        root.add(child: rootChild0)
        
        root.calculateLayout(width: 282.0, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(282.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testMeasureFlexDirectionRowAndPadding() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _simulateWrappingText($0) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.padding.left = 25.0
        root.style.padding.top = 25.0
        root.style.padding.right = 25.0
        root.style.padding.bottom = 25.0
        root.style.width = 50.0
        root.style.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test
        //.measureFunc = { _simulateWrappingText($0) }
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 5.0
        rootChild1.style.height = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(75.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.width, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureFlexDirectionColumnAndPadding() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _simulateWrappingText($0) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.margin.top = 20.0
        root.style.padding.all = 25.0
        root.style.width = 50.0
        root.style.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test//.measureFunc = { _simulateWrappingText($0) }
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 5.0
        rootChild1.style.height = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(32.0, rootChild0.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(57.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.width, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureFlexDirectionRowNoPadding() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _simulateWrappingText($0) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.margin.top = 20.0
        root.style.width = 50.0
        root.style.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test//.measureFunc = { _simulateWrappingText($0) }
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 5.0
        rootChild1.style.height = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.width, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureFlexDirectionRowNoPaddingAlignItemsFlexStart() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _simulateWrappingText($0) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.margin.top = 20.0
        root.style.width = 50.0
        root.style.height = 50.0
        root.style.alignItems = .flexStart
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test//.measureFunc = { _simulateWrappingText($0) }
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 5.0
        rootChild1.style.height = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(32.0, rootChild0.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.width, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureWithFixedSize() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _simulateWrappingText($0) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.margin.top = 20.0
        root.style.padding.all = 25.0
        root.style.width = 50.0
        root.style.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test//.measureFunc = { _simulateWrappingText($0) }
        rootChild0.style.width = 10.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 5.0
        rootChild1.style.height = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(35.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.width, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureWithFixedShrink() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _simulateWrappingText($0) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.margin.top = 20.0
        root.style.padding.all = 25.0
        root.style.width = 50.0
        root.style.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test//.measureFunc = { _simulateWrappingText($0) }
        rootChild0.style.flexShrink = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 5.0
        rootChild1.style.height = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.width, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.height, accuracy: 0.00001)
        
    }
    
    func testMeasureNoPadding() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _simulateWrappingText($0) })
        
        let root = FlexNode<NoFlexElement>()
        root.style.margin.top = 20.0
        root.style.width = 50.0
        root.style.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test//.measureFunc = { _simulateWrappingText($0) }
        rootChild0.style.flexShrink = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 5.0
        rootChild1.style.height = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(32.0, rootChild0.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(32.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.width, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.height, accuracy: 0.00001)
        
    }
    
//    func testCanNullifyMeasureFuncionOnAnyFlexNode<NoFlexElement>() {
//
//        let root = Node<NoFlexElement>()
//        root.add(child: Node<NoFlexElement>())
//        root.measureFunc = nil
//        XCTAssert(root.measureFunc == nil)
//    }
    
    func testPercentWithTextNode() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { _ in
            return Size.init(width: 90.0, height: 10.0)
        })
        
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.justifyContent = .spaceBetween
        root.style.alignItems = .center
        root.style.width = 100.0
        root.style.height = 80.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.nodeType = .test
//        rootChild1.measureFunc = { _ in
//            return Size.init(width: 90.0, height: 10.0)
//        }
        rootChild1.style.max.width = .percent(50.0)
        rootChild1.style.padding.top = .percent(50.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(15.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.height, accuracy: 0.00001)
        
    }
}
