//
//  FlexWrapTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/23/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class FlexWrapTest: XCTestCase {
    
    func testWrapColumn() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexWrap = .wrap
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 30.0
        rootChild0.style.height = 30.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 30.0
        rootChild1.style.height = 30.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.style.width = 30.0
        rootChild3.style.height = 30.0
        root.add(child: rootChild3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapRow() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.flexWrap = .wrap
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 30.0
        rootChild0.style.height = 30.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 30.0
        rootChild1.style.height = 30.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.style.width = 30.0
        rootChild3.style.height = 30.0
        root.add(child: rootChild3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapRowAlignItemsFlexEnd() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .flexEnd
        root.style.flexWrap = .wrap
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 30.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 30.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.style.width = 30.0
        rootChild3.style.height = 30.0
        root.add(child: rootChild3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapRowAlignItemsCenter() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.alignItems = .center
        root.style.flexWrap = .wrap
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 30.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 30.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.style.width = 30.0
        rootChild3.style.height = 30.0
        root.add(child: rootChild3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testFlexWrapChildrenWithMinMainOverridingFlexBasis() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.flexWrap = .wrap
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.flexBasis = 50.0
        rootChild0.style.min.width = 55.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.flexBasis = 50.0
        rootChild1.style.min.width = 55.0
        rootChild1.style.height = 50.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(55.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(55.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(55.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(55.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testFlexWrapWrapToChildHeight() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .column
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.flexDirection = .row
        rootChild0.style.alignItems = .flexStart
        rootChild0.style.flexWrap = .wrap
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.style.width = 100.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.style.width = 100.0
        rootChild0Child0Child0.style.height = 100.0
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 100.0
        rootChild1.style.height = 100.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testFlexWrapAlignStretchFitsOneRow() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.flexWrap = .wrap
        root.style.width = 150.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 50.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
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
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapReverseRowAlignContentFlexStart() {
        let root = FlexNode<NoFlexElement>()
        root.style.flexDirection = .row
        root.style.flexWrap = .wrapReverse
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.width = 30.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.style.width = 30.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.style.width = 30.0
        rootChild3.style.height = 40.0
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.style.width = 30.0
        rootChild4.style.height = 50.0
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapReverseRowAlignContentCenter() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .center
        root.style.flexWrap = .wrapReverse
        root.style.width = 100.0

        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 30.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)

        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 30.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)

        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)

        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.width = 30.0
        rootChild3.style.height = 40.0
        root.add(child: rootChild3)

        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.width = 30.0
        rootChild4.style.height = 50.0
        root.add(child: rootChild4)

        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)

        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(60.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(30.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)

        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)

        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(70.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(10.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(70.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(40.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)

    }
    
    func testWrapReverseRowSingleLineDifferentSize() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.flexWrap = .wrapReverse
        root.style.width = 300.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 30.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 30.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.width = 30.0
        rootChild3.style.height = 40.0
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.width = 30.0
        rootChild4.style.height = 50.0
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(120.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(270.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(240.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(210.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(180.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(150.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapReverseRowAlignContentStretch() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrapReverse
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 30.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 30.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.width = 30.0
        rootChild3.style.height = 40.0
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.width = 30.0
        rootChild4.style.height = 50.0
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapReverseRowAlignContentSpaceAround() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .spaceAround
        root.style.flexWrap = .wrapReverse
        root.style.width = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 30.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 30.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.width = 30.0
        rootChild3.style.height = 40.0
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.width = 30.0
        rootChild4.style.height = 50.0
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapReverseColumnFixSize() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .center
        root.style.flexWrap = .wrapReverse
        root.style.width = 200.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 30.0
        rootChild0.style.height = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 30.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 30.0
        rootChild2.style.height = 30.0
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.width = 30.0
        rootChild3.style.height = 40.0
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.width = 30.0
        rootChild4.style.height = 50.0
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(170.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(170.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(170.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(170.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(140.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapRowWithinAlignItemsCenter() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .center
        root.style.width = 200.0
        root.style.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.flexWrap = .wrap
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.width = 150.0
        rootChild0Child0.style.height = 80.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.width = 80.0
        rootChild0Child1.style.height = 80.0
        rootChild0.add(child: rootChild0Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(120.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapRowWithinAlignItemsFlexStart() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .flexStart
        root.style.width = 200.0
        root.style.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.flexWrap = .wrap
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.width = 150.0
        rootChild0Child0.style.height = 80.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.width = 80.0
        rootChild0Child1.style.height = 80.0
        rootChild0.add(child: rootChild0Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(120.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapRowWithinAlignItemsFlexEnd() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .flexEnd
        root.style.width = 200.0
        root.style.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.flexWrap = .wrap
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.width = 150.0
        rootChild0Child0.style.height = 80.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.width = 80.0
        rootChild0Child1.style.height = 80.0
        rootChild0.add(child: rootChild0Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(120.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapColumnMaxHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.justifyContent = .center
        root.style.alignContent = .center
        root.style.alignItems = .center
        root.style.flexWrap = .wrap
        root.style.width = 700.0
        root.style.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 100.0
        rootChild0.style.height = 500.0
        rootChild0.style.max.height = 200.0
        rootChild0.style.flexWrap = .wrap
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.margin.left = 20.0
        rootChild1.style.margin.top = 20.0
        rootChild1.style.margin.right = 20.0
        rootChild1.style.margin.bottom = 20.0
        rootChild1.style.width = 200.0
        rootChild1.style.height = 200.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild0Child1"
        rootChild2.style.width = 100.0
        rootChild2.style.height = 100.0
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(700.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(250.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(200.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(250.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(420.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(700.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(350.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(300.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(250.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(180.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapColumnMaxHeightFlex() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.justifyContent = .center
        root.style.alignContent = .center
        root.style.alignItems = .center
        root.style.flexWrap = .wrap
        root.style.width = 700.0
        root.style.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexShrink = 1.0
        rootChild0.style.flexBasis = .percent(0.0)
        rootChild0.style.width = 100.0
        rootChild0.style.height = 500.0
        rootChild0.style.max.height = 200.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.flexShrink = 1.0
        rootChild1.style.flexBasis = .percent(0.0)
        rootChild1.style.margin.left = 20.0
        rootChild1.style.margin.top = 20.0
        rootChild1.style.margin.right = 20.0
        rootChild1.style.margin.bottom = 20.0
        rootChild1.style.width = 200.0
        rootChild1.style.height = 200.0
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild0Child1"
        rootChild2.style.width = 100.0
        rootChild2.style.height = 100.0
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(700.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(300.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(180.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(250.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(180.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(300.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(700.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(300.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(180.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(250.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(180.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(300.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapNodesWithContentSizingOverflowingMargin() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 500.0
        root.style.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.flexWrap = .wrap
        rootChild0.style.width = 85.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.width = 40.0
        rootChild0Child0Child0.style.height = 40.0
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.margin.right = 10.0
        rootChild0.add(child: rootChild0Child1)
        
        let rootChild0Child1Child0 = FlexNode<NoFlexElement>()
        rootChild0Child1Child0.name = "rootChild0Child1Child0"
        rootChild0Child1Child0.style.width = 40.0
        rootChild0Child1Child0.style.height = 40.0
        rootChild0Child1.add(child: rootChild0Child1Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(85.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(415.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(85.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(35.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testWrapNodesWithContentSizingMarginCross() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 500.0
        root.style.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.flexWrap = .wrap
        rootChild0.style.width = 70.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.width = 40.0
        rootChild0Child0Child0.style.height = 40.0
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.margin.top = 10.0
        rootChild0.add(child: rootChild0Child1)
        
        let rootChild0Child1Child0 = FlexNode<NoFlexElement>()
        rootChild0Child1Child0.name = "rootChild0Child1Child0"
        rootChild0Child1Child0.style.width = 40.0
        rootChild0Child1Child0.style.height = 40.0
        rootChild0Child1.add(child: rootChild0Child1Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(430.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    
}
