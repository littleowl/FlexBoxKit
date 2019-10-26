//
//  AbsolutePositionTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/16/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class AbsolutePositionTest: XCTestCase {

    func testAbsoluteLayoutWidthHeightStartTop() {
        let root = FlexNode<NoFlexElement>()
        root.style.dimensions.width = .point(100.0)
        root.style.dimensions.height = .point(100.0)
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.start = .point(10.0)
        rootChild0.style.position.top = .point(10.0)
        rootChild0.style.dimensions.width = .point(10.0)
        rootChild0.style.dimensions.height = .point(10.0)
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAbsoluteLayoutWidthHeightEndBottom() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.end = 10.0
        rootChild0.style.position.bottom = 10.0
        rootChild0.style.dimensions.width = 10.0
        rootChild0.style.dimensions.height = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutStartTopEndBottom() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.start = 10.0
        rootChild0.style.position.top = 10.0
        rootChild0.style.position.end = 10.0
        rootChild0.style.position.bottom = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }

    func testAbsoluteLayoutWidthHeightStartTopEndBottom() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.start = 10.0
        rootChild0.style.position.top = 10.0
        rootChild0.style.position.end = 10.0
        rootChild0.style.position.bottom = 10.0
        rootChild0.style.dimensions.width = 10.0
        rootChild0.style.dimensions.height = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testDoNotClampHeightOfAbsoluteNodeToHeightOfItsOverflowHiddenParent() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.overflow = .hidden
        root.style.dimensions.width = 50.0
        root.style.dimensions.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.start = 0.0
        rootChild0.style.position.top = 0.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.dimensions.width = 100.0
        rootChild0Child0.style.dimensions.height = 100.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutWithinBorder() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.margin.left = 10.0
        root.style.margin.top = 10.0
        root.style.margin.right = 10.0
        root.style.margin.bottom = 10.0
        root.style.padding.left = 10.0
        root.style.padding.top = 10.0
        root.style.padding.right = 10.0
        root.style.padding.bottom = 10.0
        root.style.border.left = 10.0
        root.style.border.top = 10.0
        root.style.border.right = 10.0
        root.style.border.bottom = 10.0
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.left = 0.0
        rootChild0.style.position.top = 0.0
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.positionType = .absolute
        rootChild1.style.position.right = 0.0
        rootChild1.style.position.bottom = 0.0
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 50.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.positionType = .absolute
        rootChild2.style.position.left = 0.0
        rootChild2.style.position.top = 0.0
        rootChild2.style.margin.left = 10.0
        rootChild2.style.margin.top = 10.0
        rootChild2.style.margin.right = 10.0
        rootChild2.style.margin.bottom = 10.0
        rootChild2.style.dimensions.width = 50.0
        rootChild2.style.dimensions.height = 50.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.positionType = .absolute
        rootChild3.style.position.right = 0.0
        rootChild3.style.position.bottom = 0.0
        rootChild3.style.margin.left = 10.0
        rootChild3.style.margin.top = 10.0
        rootChild3.style.margin.right = 10.0
        rootChild3.style.margin.bottom = 10.0
        rootChild3.style.dimensions.width = 50.0
        rootChild3.style.dimensions.height = 50.0
        root.add(child: rootChild3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(10.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(10.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutAlignItemsAndJustifyContentCenter() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.flexGrow = 1.0
        root.style.dimensions.width = 110.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.dimensions.width = 60.0
        rootChild0.style.dimensions.height = 40.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
 
    func testAbsoluteLayoutAlignItemsAndJustifyContentFlexEnd() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .flexEnd
        root.style.alignItems = .flexEnd
        root.style.flexGrow = 1.0
        root.style.dimensions.width = 110.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.dimensions.width = 60.0
        rootChild0.style.dimensions.height = 40.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutJustifyContentCenter() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.flexGrow = 1.0
        root.style.dimensions.width = 110.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.dimensions.width = 60.0
        rootChild0.style.dimensions.height = 40.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutAlignItemsCenter() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignItems = .center
        root.style.flexGrow = 1.0
        root.style.dimensions.width = 110.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.dimensions.width = 60.0
        rootChild0.style.dimensions.height = 40.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutAlignItemsCenterOnChildOnly() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexGrow = 1.0
        root.style.dimensions.width = 110.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.alignSelf = .center
        rootChild0.style.positionType = .absolute
        rootChild0.style.dimensions.width = 60.0
        rootChild0.style.dimensions.height = 40.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndTopPosition() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.flexGrow = 1.0
        root.style.dimensions.width = 110.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.top = 10.0
        rootChild0.style.dimensions.width = 60.0
        rootChild0.style.dimensions.height = 40.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndBottomPosition() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.flexGrow = 1.0
        root.style.dimensions.width = 110.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.bottom = 10.0
        rootChild0.style.dimensions.width = 60.0
        rootChild0.style.dimensions.height = 40.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndLeftPosition() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.flexGrow = 1.0
        root.style.dimensions.width = 110.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.left = 5.0
        rootChild0.style.dimensions.width = 60.0
        rootChild0.style.dimensions.height = 40.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(5.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(5.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndRightPosition() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.flexGrow = 1.0
        root.style.dimensions.width = 110.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.right = 5.0
        rootChild0.style.dimensions.width = 60.0
        rootChild0.style.dimensions.height = 40.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(110.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPositionRootWithRightToLeftShouldPositionWithoutDirection() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.position.left = 72.0
        root.style.dimensions.width = 52.0
        root.style.dimensions.height = 52.0
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(72.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(72.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAbsoluteLayoutPercentageBottomBasedOnParentHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.top = .percent(50.0)
        rootChild0.style.dimensions.width = 10.0
        rootChild0.style.dimensions.height = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.positionType = .absolute
        rootChild1.style.position.bottom = .percent(50.0)
        rootChild1.style.dimensions.width = 10.0
        rootChild1.style.dimensions.height = 10.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.positionType = .absolute
        rootChild2.style.position.top = .percent(10.0)
        rootChild2.style.position.bottom = .percent(10.0)
        rootChild2.style.dimensions.width = 10.0
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutInWrapReverseColumnContainer() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexWrap = .wrapReverse
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.dimensions.width = 20.0
        rootChild0.style.dimensions.height = 20.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutInWrapReverseRowContainer() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.flexWrap = .wrapReverse
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.dimensions.width = 20.0
        rootChild0.style.dimensions.height = 20.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutInWrapReverseColumnContainerFlexEnd() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexWrap = .wrapReverse
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.alignSelf = .flexEnd
        rootChild0.style.positionType = .absolute
        rootChild0.style.dimensions.width = 20.0
        rootChild0.style.dimensions.height = 20.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testAbsoluteLayoutInWrapReverseRowContainerFlexEnd() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.flexWrap = .wrapReverse
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.alignSelf = .flexEnd
        rootChild0.style.positionType = .absolute
        rootChild0.style.dimensions.width = 20.0
        rootChild0.style.dimensions.height = 20.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
//    static var allTests = [
//        ("testAbsoluteLayoutWidthHeightStartTop", testAbsoluteLayoutWidthHeightStartTop),
//        ("testAbsoluteLayoutWidthHeightEndBottom", testAbsoluteLayoutWidthHeightEndBottom),
//        ("testAbsoluteLayoutStartTopEndBottom", testAbsoluteLayoutStartTopEndBottom),
//        ("testAbsoluteLayoutWidthHeightStartTopEndBottom", testAbsoluteLayoutWidthHeightStartTopEndBottom),
//        ("testDoNotClampHeightOfAbsoluteNodeToHeightOfItsOverflowHiddenParent", testDoNotClampHeightOfAbsoluteNodeToHeightOfItsOverflowHiddenParent),
//        ("testAbsoluteLayoutWithinBorder", testAbsoluteLayoutWithinBorder),
//        ("testAbsoluteLayoutAlignItemsAndJustifyContentCenter", testAbsoluteLayoutAlignItemsAndJustifyContentCenter),
//        ("testAbsoluteLayoutAlignItemsAndJustifyContentFlexEnd", testAbsoluteLayoutAlignItemsAndJustifyContentFlexEnd),
//        ("testAbsoluteLayoutAlignItemsCenterOnChildOnly", testAbsoluteLayoutAlignItemsCenterOnChildOnly),
//        ("testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndTopPosition", testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndTopPosition),
//        ("testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndBottomPosition", testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndBottomPosition),
//        ("testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndLeftPosition", testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndLeftPosition),
//        ("testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndRightPosition", testAbsoluteLayoutAlignItemsAndJustifyContentCenterAndRightPosition),
//        ("testPositionRootWithRightToLeftShouldPositionWithoutDirection", testPositionRootWithRightToLeftShouldPositionWithoutDirection),
//        ("testAbsoluteLayoutPercentageBottomBasedOnParentHeight", testAbsoluteLayoutPercentageBottomBasedOnParentHeight),
//        ("testAbsoluteLayoutInWrapReverseColumnContainer", testAbsoluteLayoutInWrapReverseColumnContainer),
//        ("testAbsoluteLayoutInWrapReverseRowContainer", testAbsoluteLayoutInWrapReverseRowContainer),
//        ("testAbsoluteLayoutInWrapReverseColumnContainerFlexEnd", testAbsoluteLayoutInWrapReverseColumnContainerFlexEnd),
//        ("testAbsoluteLayoutInWrapReverseRowContainerFlexEnd", testAbsoluteLayoutInWrapReverseRowContainerFlexEnd),
//    ]
}
