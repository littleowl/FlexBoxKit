//
//  MinMaxDimensionTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/21/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class MinMaxDimensionTest: XCTestCase {
    
    func testMaxWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 100.0
        root.style.height = 100.0

        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.max.width = 50.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)

        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)

        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testMaxHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 10.0
        rootChild0.style.max.height = 50.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testMinHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.min.height = 60.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testMinWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.min.width = 60.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentMinMax() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.width = 100.0
        root.style.min.height = 100.0
        root.style.max.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 60.0
        rootChild0.style.height = 60.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)

        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(40.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAlignItemsMinMax() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignItems = .center
        root.style.min.width = 100.0
        root.style.max.width = 200.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 60.0
        rootChild0.style.height = 60.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentOverflowMinMax() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.min.height = 100.0
        root.style.max.height = 110.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 50.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 50.0
        rootChild2.style.height = 50.0
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(-20.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(-20.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowToMin() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 100.0
        root.style.min.height = 100.0
        root.style.max.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexShrink = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.height = 50.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowInAtMostContainer() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexBasis = 0.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowChild() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = 0.0
        rootChild0.style.height = 100.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowWithinConstrainedMinMaxColumn() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.min.height = 100.0
        root.style.max.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.height = 50.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowWithinMaxWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 200.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.max.width = 100.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.height = 20.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowWithinConstrainedMaxWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 200.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.max.width = 300.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.height = 20.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexRootIgnored() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexGrow = 1.0
        root.style.width = 100.0
        root.style.min.height = 100.0
        root.style.max.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = 200.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.height = 100.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowRootMinimized() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 100.0
        root.style.min.height = 100.0
        root.style.max.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.max.height = 100.0
        rootChild0.style.max.height = 500.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexBasis = 200.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.height = 100.0
        rootChild0.add(child: rootChild0Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowRootMaximized() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 100.0
        root.style.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.max.height = 100.0
        rootChild0.style.max.height = 500.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexBasis = 200.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.height = 100.0
        rootChild0.add(child: rootChild0Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowWithinConstrainedMinRow() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.min.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowWithinConstrainedMinColumn() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.min.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.height = 50.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowWithinConstrainedMaxRow() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.max.width = 100.0
        rootChild0.style.height = 100.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexShrink = 1.0
        rootChild0Child0.style.flexBasis = 100.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.width = 50.0
        rootChild0.add(child: rootChild0Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testFlexGrowWithinConstrainedMaxColumn() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 100.0
        root.style.max.height = 100.0

        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexShrink = 1.0
        rootChild0.style.flexBasis = 100.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.height = 50.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testChildMinMaxWidthFlexing() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.width = 120.0
        root.style.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = 0.0
        rootChild0.style.min.width = 60.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.flexBasis = 50.0
        rootChild1.style.max.width = 20.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testMinWidthOverridesWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 50.0
        root.style.min.width = 100.0
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testMaxWidthOverridesWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 200.0
        root.style.max.width = 100.0
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testMinHeightOverridesHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.height = 50.0
        root.style.min.height = 100.0
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testMaxHeightOverridesHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.height = 200.0
        root.style.max.height = 100.0
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testMinMaxPercentNoWidthHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.min.width = .percent(10.0)
        rootChild0.style.max.width = .percent(10.0)
        rootChild0.style.min.height = .percent(10.0)
        rootChild0.style.max.height = .percent(10.0)
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
}
