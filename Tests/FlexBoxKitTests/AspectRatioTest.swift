//
//  AspectRatioTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/21/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

fileprivate func _measure(task: MeasureTask) -> Size {
    return Size.init(
        width: task.widthMode == .exactly ? (task.width ?? 50.0) : 50.0,
        height: task.heightMode == .exactly ? (task.height ?? 50.0) : 50.0)
}

class AspectRatioTest: XCTestCase {
    
    func testAspectRatioCrossDefined() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioMainDefined() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 50.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioBothDimensionsDefinedRow() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 100.0
        rootChild0.style.height = 50.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioBothDimensionsDefinedColumn() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 100.0
        rootChild0.style.height = 50.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioAlignStretch() {
        let root = FlexNode<NoFlexElement>()
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioFlexGrow() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 50.0
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioFlexShrink() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 150.0
        rootChild0.style.flexShrink = 1.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioFlexShrink2() {
        let root = FlexNode<NoFlexElement>()
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = .percent(100.0)
        rootChild0.style.flexShrink = 1.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.height = .percent(100.0)
        rootChild1.style.flexShrink = 1.0
        rootChild1.style.aspectRatio = 1.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioBasis() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.flexBasis = 50.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioAbsoluteLayoutWidthDefined() {
        let root = FlexNode<NoFlexElement>()
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.left = 0.0
        rootChild0.style.position.top = 0.0
        rootChild0.style.width = 50.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioAbsoluteLayoutHeightDefined() {
        let root = FlexNode<NoFlexElement>()
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.left = 0.0
        rootChild0.style.position.top = 0.0
        rootChild0.style.height = 50.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioWithMaxCrossDefined() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 50.0
        rootChild0.style.max.width = 40.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioWithMaxMainDefined() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.max.height = 40.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioWithMinCrossDefined() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 30.0
        rootChild0.style.min.width = 40.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioWithMinMainDefined() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 30.0
        rootChild0.style.min.height = 40.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioDoubleCross() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 50.0
        rootChild0.style.aspectRatio = 2.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioHalfCross() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 100.0
        rootChild0.style.aspectRatio = 0.5
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioDoubleMain() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.aspectRatio = 0.5
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioHalfMain() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 100.0
        rootChild0.style.aspectRatio = 2.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioWithMeasureFunction() {
        let root = FlexNode<NoFlexElement>()
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: _measure)
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.nodeType = .test//.measureFunc = _measure
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioWidthHeightFlexGrowRow() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioWidthHeightFlexGrowColumn() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.alignItems = .flexStart
        root.style.width = 200.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioHeightAsFlexBasis() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .flexStart
        root.style.width = 200.0
        root.style.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 50.0
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.height = 100.0
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.aspectRatio = 1.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(75.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioWidthAsFlexBasis() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.alignItems = .flexStart
        root.style.width = 200.0
        root.style.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 100.0
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.aspectRatio = 1.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioOverridesFlexGrowRow() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.aspectRatio = 0.5
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioOverridesFlexGrowColumn() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.aspectRatio = 2.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioLeftRightAbsolute() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.left = 10.0
        rootChild0.style.position.top = 10.0
        rootChild0.style.position.right = 10.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioTopBottomAbsolute() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.left = 10.0
        rootChild0.style.position.top = 10.0
        rootChild0.style.position.bottom = 10.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioWidthOverridesAlignStretchRow() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioHeightOverridesAlignStretchColumn() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 50.0
        rootChild0.style.aspectRatio = 1.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioAllowChildOverflowParentSize() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 50.0
        rootChild0.style.aspectRatio = 4.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioDefinedMainWithMargin() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.alignItems = .center
        root.style.justifyContent = .center
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.height = 50.0
        rootChild0.style.aspectRatio = 1.0
        rootChild0.style.margin.left = 10.0
        rootChild0.style.margin.right = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioDefinedCrossWithMargin() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.alignItems = .center
        root.style.justifyContent = .center
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.aspectRatio = 1.0
        rootChild0.style.margin.left = 10.0
        rootChild0.style.margin.right = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioDefinedCrossWithMainMargin() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        root.style.alignItems = .center
        root.style.justifyContent = .center
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        rootChild0.style.aspectRatio = 1.0
        rootChild0.style.margin.top = 10.0
        rootChild0.style.margin.bottom = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioShouldPreferExplicitHeight() {
        
        let useWebDefaults = true
        
        let root = FlexNode<NoFlexElement>(useWebDefaults: useWebDefaults)
        root.style.flexDirection = .column
        
        let rootChild0 = FlexNode<NoFlexElement>(useWebDefaults: useWebDefaults)
        rootChild0.style.flexDirection = .column
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>(useWebDefaults: useWebDefaults)
        rootChild0Child0.style.flexDirection = .column
        rootChild0Child0.style.height = 100.0
        rootChild0Child0.style.aspectRatio = 2.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: 100.0, height: 200.0, direction: .leftToRight)
        
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(200.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
    }

    func testAspectRatioShouldPreferExplicitWidth() {
        
        let useWebDefaults = true
        
        let root = FlexNode<NoFlexElement>(useWebDefaults: useWebDefaults)
        root.style.flexDirection = .row

        let rootChild0 = FlexNode<NoFlexElement>(useWebDefaults: useWebDefaults)
        rootChild0.style.flexDirection = .row
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>(useWebDefaults: useWebDefaults)
        rootChild0Child0.style.flexDirection = .row
        rootChild0Child0.style.width = 100.0
        rootChild0Child0.style.aspectRatio = 0.5
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: 200.0, height: 100.0, direction: .leftToRight)
        
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAspectRatioShouldPreferFlexedDimension() {
        let useWebDefaults = true
        let root = FlexNode<NoFlexElement>(useWebDefaults: useWebDefaults)

        let rootChild0 = FlexNode<NoFlexElement>(useWebDefaults: useWebDefaults)
        rootChild0.style.flexDirection = .column
        rootChild0.style.aspectRatio = 2.0
        rootChild0.style.flexGrow = 1.0
        root.add(child: rootChild0)

        let rootChild0Child0 = FlexNode<NoFlexElement>(useWebDefaults: useWebDefaults)
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.aspectRatio = 4.0
        rootChild0.add(child: rootChild0Child0)

        root.calculateLayout(width: 100.0, height: 100.0, direction: .leftToRight)

        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(200.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
//
    }
    
}
