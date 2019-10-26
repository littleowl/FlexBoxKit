//
//  AlignBaselineTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

fileprivate func _baselineFunc(
    task: BaselineTask
    ) -> Float
{
    return task.height * 0.5
}

fileprivate func _measure1(
    task: MeasureTask
    ) -> Size
{
    return Size.init(width: 42.0, height: 50.0)
}

fileprivate func _measure2(
    task: MeasureTask
    ) -> Size
{
    return Size.init(width: 279.0, height: 126.0)
}

fileprivate func createNode(
    _ direction: FlexDirection,
    _ width: Float,
    _ height: Float,
    _ alignBaseline: Bool)
    -> FlexNode<NoFlexElement>
{
    let node = FlexNode<NoFlexElement>()
    node.style.flexDirection = direction
    node.style.width = .point(width)
    node.style.height = .point(height)
    if alignBaseline {
        node.style.alignItems = .baseline
    }
    return node
}

class AlignBaselineTest: XCTestCase {
    
    func testAlignContentFlexStart() {
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: _measure1)
        
        let test2: FlexNodeType = .custom(FlexNodeType.RawValue(value: "test2", isText: true))
        
        context[test2] = MeasureHolder(closure: _measure2)
        
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.alignItems = .baseline
        root.style.width = 340.0
        root.style.max.height = 170.0
        root.style.min.height = 0.0

        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 0.0
        rootChild0.style.flexShrink = 1.0
        rootChild0.nodeType = .test//.measureFunc = _measure1
        root.add(child: rootChild0)

        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 0.0
        rootChild1.style.flexShrink = 1.0
        rootChild1.nodeType = test2//.measureFunc = _measure2
        root.add(child: rootChild1)

        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)

        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(340.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(126.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(76.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(42.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(42.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(279.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(126.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)

    }
    
    func testAlignBaselineWithNoParentHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 150.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 40.0
        rootChild1.nodeType = .test//.baselineFunc = _baselineFunc
        root.add(child: rootChild1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(70.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineWithNoBaselineFunctionAndNoParentHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 150.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 80.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 50.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildInColumnAsReference() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.column, 500.0, 800.0, false)
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 300.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1.add(child: rootChild1Child1)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildWithPaddingInColumnAsReference() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.column, 500.0, 800.0, false)
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 300.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        rootChild1Child1.style.padding.left = 100.0
        rootChild1Child1.style.padding.right = 100.0
        rootChild1Child1.style.padding.top = 100.0
        rootChild1Child1.style.padding.bottom = 100.0
        rootChild1.add(child: rootChild1Child1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentWithPaddingUsingChildInColumnAsReference() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.column, 500.0, 800.0, false)
        rootChild1.style.padding.left = 100.0
        rootChild1.style.padding.top = 100.0
        rootChild1.style.padding.right = 100.0
        rootChild1.style.padding.bottom = 100.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 300.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        rootChild1.add(child: rootChild1Child1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentWithMarginUsingChildInColumnAsReference() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.column, 500.0, 800.0, false)
        rootChild1.style.margin.left = 100.0
        rootChild1.style.margin.top = 100.0
        rootChild1.style.margin.right = 100.0
        rootChild1.style.margin.bottom = 100.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 300.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        rootChild1.add(child: rootChild1Child1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(600.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildWithMarginInColumnAsReference() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.column, 500.0, 800.0, false)
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 300.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        rootChild1Child1.style.margin.left = 100.0
        rootChild1Child1.style.margin.top = 100.0
        rootChild1Child1.style.margin.right = 100.0
        rootChild1Child1.style.margin.bottom = 100.0
        rootChild1.add(child: rootChild1Child1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildInRowAsReference() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.row, 500.0, 800.0, true)
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 500.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        rootChild1.add(child: rootChild1Child1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildWithPaddingInRowAsReference() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.row, 500.0, 800.0, true)
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 500.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        rootChild1Child1.style.padding.left = 100.0
        rootChild1Child1.style.padding.right = 100.0
        rootChild1Child1.style.padding.top = 100.0
        rootChild1Child1.style.padding.bottom = 100.0
        rootChild1.add(child: rootChild1Child1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildWithMarginInRowAsReference() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.row, 500.0, 800.0, true)
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 500.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        rootChild1Child1.style.margin.left = 100.0
        rootChild1Child1.style.margin.right = 100.0
        rootChild1Child1.style.margin.top = 100.0
        rootChild1Child1.style.margin.bottom = 100.0
        rootChild1.add(child: rootChild1Child1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(600.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildInColumnAsReferenceWithNoBaselineFunction() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.column, 500.0, 800.0, false)
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 300.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.isReferenceBaseline = true
        rootChild1.add(child: rootChild1Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildInRowAsReferenceWithNoBaselineFunction() {
        let root = createNode(.row, 1000.0, 1000.0, true)
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = createNode(.row, 500.0, 800.0, true)
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 500.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.isReferenceBaseline = true
        rootChild1.add(child: rootChild1Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildInColumnAsReferenceWithHeightNotSpecific() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 1000.0
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.flexDirection = .column
        rootChild1.style.width = 500.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 300.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        rootChild1.add(child: rootChild1Child1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(800.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(700.0, rootChild1.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildInRowAsReferenceWithHeightNotSpecific() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 1000.0
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.flexDirection = .row
        rootChild1.style.width = 500.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 500.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.nodeType = .test//.baselineFunc = _baselineFunc
        rootChild1Child1.isReferenceBaseline = true
        rootChild1.add(child: rootChild1Child1)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: _baselineFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(900.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild1.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildInColumnAsReferenceWithNoBaselineFuncAndHeightNotSpecific() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 1000.0
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.flexDirection = .column
        rootChild1.style.width = 500.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 300.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.isReferenceBaseline = true
        rootChild1.add(child: rootChild1Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(700.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(700.0, rootChild1.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
    
    func testAlignBaselineParentUsingChildInRowAsReferenceWithNoBaselineAndHeightNotSpecific() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 1000.0
        
        let rootChild0 = createNode(.column, 500.0, 600.0, false)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.flexDirection = .row
        rootChild1.style.width = 500.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = createNode(.column, 500.0, 500.0, false)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = createNode(.column, 500.0, 400.0, false)
        rootChild1Child1.isReferenceBaseline = true
        rootChild1.add(child: rootChild1Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(700.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild1.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        
    }
}
