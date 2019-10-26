//
//  AlignItemsTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/21/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class AlignItemsTest: XCTestCase {
    
    func testAlignItemsStretch() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsCenter() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .center
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 10.0
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsFlexStart() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .flexStart
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 10.0
        rootChild0.style.dimensions.height = 10.0
        
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
    
    func testAlignItemsFlexEnd() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .flexEnd
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 10.0
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaseline() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 20.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineChild() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild0"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1"
        rootChild1Child0.style.dimensions.width = 50.0
        rootChild1Child0.style.dimensions.height = 10.0
        rootChild1.add(child: rootChild1Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineChildMultiline() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 60.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexDirection = .row
        rootChild1.style.flexWrap = .wrap
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 25.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.dimensions.width = 25.0
        rootChild1Child0.style.dimensions.height = 20.0
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = FlexNode<NoFlexElement>()
        rootChild1Child1.name = "rootChild1Child1"
        rootChild1Child1.style.dimensions.width = 25.0
        rootChild1Child1.style.dimensions.height = 10.0
        rootChild1.add(child: rootChild1Child1)
        
        let rootChild1Child2 = FlexNode<NoFlexElement>()
        rootChild1Child2.name = "rootChild0"
        rootChild1Child2.style.dimensions.width = 25.0
        rootChild1Child2.style.dimensions.height = 20.0
        rootChild1.add(child: rootChild1Child2)
        
        let rootChild1Child3 = FlexNode<NoFlexElement>()
        rootChild1Child3.name = "rootChild0"
        rootChild1Child3.style.dimensions.width = 25.0
        rootChild1Child3.style.dimensions.height = 10.0
        rootChild1.add(child: rootChild1Child3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineChildMultilineOverride() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 60.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexDirection = .row
        rootChild1.style.flexWrap = .wrap
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 25.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.dimensions.width = 25.0
        rootChild1Child0.style.dimensions.height = 20.0
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = FlexNode<NoFlexElement>()
        rootChild1Child1.name = "rootChild1Child1"
        rootChild1Child1.style.alignSelf = .baseline
        rootChild1Child1.style.dimensions.width = 25.0
        rootChild1Child1.style.dimensions.height = 10.0
        rootChild1.add(child: rootChild1Child1)
        
        let rootChild1Child2 = FlexNode<NoFlexElement>()
        rootChild1Child2.name = "rootChild0"
        rootChild1Child2.style.dimensions.width = 25.0
        rootChild1Child2.style.dimensions.height = 20.0
        rootChild1.add(child: rootChild1Child2)
        
        let rootChild1Child3 = FlexNode<NoFlexElement>()
        rootChild1Child3.name = "rootChild0"
        rootChild1Child3.style.alignSelf = .baseline
        rootChild1Child3.style.dimensions.width = 25.0
        rootChild1Child3.style.dimensions.height = 10.0
        rootChild1.add(child: rootChild1Child3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineChildMultilineNoOverrideOnSecondline() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 60.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexDirection = .row
        rootChild1.style.flexWrap = .wrap
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 25.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.dimensions.width = 25.0
        rootChild1Child0.style.dimensions.height = 20.0
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = FlexNode<NoFlexElement>()
        rootChild1Child1.name = "rootChild1Child1"
        rootChild1Child1.style.dimensions.width = 25.0
        rootChild1Child1.style.dimensions.height = 10.0
        rootChild1.add(child: rootChild1Child1)
        
        let rootChild1Child2 = FlexNode<NoFlexElement>()
        rootChild1Child2.name = "rootChild0"
        rootChild1Child2.style.dimensions.width = 25.0
        rootChild1Child2.style.dimensions.height = 20.0
        rootChild1.add(child: rootChild1Child2)
        
        let rootChild1Child3 = FlexNode<NoFlexElement>()
        rootChild1Child3.name = "rootChild0"
        rootChild1Child3.style.alignSelf = .baseline
        rootChild1Child3.style.dimensions.width = 25.0
        rootChild1Child3.style.dimensions.height = 10.0
        rootChild1.add(child: rootChild1Child3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1Child2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1Child3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineChildTop() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.position.top = 10.0
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 50.0
        rootChild1Child0.style.height = 10.0
        rootChild1.add(child: rootChild1Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineChildTop2() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.position.top = 5.0
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 50.0
        rootChild1Child0.style.height = 10.0
        rootChild1.add(child: rootChild1Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(45.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(45.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineDoubleNestedChild() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.width = 50.0
        rootChild0Child0.style.height = 20.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 50.0
        rootChild1Child0.style.height = 15.0
        rootChild1.add(child: rootChild1Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(15.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(15.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineColumn() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .baseline
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineChildMargin() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.margin.left = 5.0
        rootChild0.style.margin.top = 5.0
        rootChild0.style.margin.right = 5.0
        rootChild0.style.margin.bottom = 5.0
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.margin.left = 1.0
        rootChild1Child0.style.margin.top = 1.0
        rootChild1Child0.style.margin.right = 1.0
        rootChild1Child0.style.margin.bottom = 1.0
        rootChild1Child0.style.width = 50.0
        rootChild1Child0.style.height = 10.0
        rootChild1.add(child: rootChild1Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(5.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(44.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(1.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(1.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-10.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(44.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-1.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(1.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineChildPadding() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.padding.left = 5.0
        root.style.padding.top = 5.0
        root.style.padding.right = 5.0
        root.style.padding.bottom = 5.0
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.padding.left = 5.0
        rootChild1.style.padding.top = 5.0
        rootChild1.style.padding.right = 5.0
        rootChild1.style.padding.bottom = 5.0
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 50.0
        rootChild1Child0.style.height = 10.0
        rootChild1.add(child: rootChild1Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(5.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(55.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(5.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-5.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-5.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineMultiline() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.flexWrap = .wrap
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 50.0
        rootChild1Child0.style.height = 10.0
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 50.0
        rootChild2.style.height = 20.0
        root.add(child: rootChild2)
        
        let rootChild2Child0 = FlexNode<NoFlexElement>()
        rootChild2Child0.name = "rootChild2Child0"
        rootChild2Child0.style.width = 50.0
        rootChild2Child0.style.height = 10.0
        rootChild2.add(child: rootChild2Child0)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.width = 50.0
        rootChild3.style.height = 50.0
        root.add(child: rootChild3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineMultilineColumn() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .baseline
        root.style.flexWrap = .wrap
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 30.0
        rootChild1.style.height = 50.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 20.0
        rootChild1Child0.style.height = 20.0
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 40.0
        rootChild2.style.height = 70.0
        root.add(child: rootChild2)
        
        let rootChild2Child0 = FlexNode<NoFlexElement>()
        rootChild2Child0.name = "rootChild2Child0"
        rootChild2Child0.style.width = 10.0
        rootChild2Child0.style.height = 10.0
        rootChild2.add(child: rootChild2Child0)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.width = 50.0
        rootChild3.style.height = 20.0
        root.add(child: rootChild3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild2Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineMultilineColumn2() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .baseline
        root.style.flexWrap = .wrap
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 30.0
        rootChild1.style.height = 50.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 20.0
        rootChild1Child0.style.height = 20.0
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 40.0
        rootChild2.style.height = 70.0
        root.add(child: rootChild2)
        
        let rootChild2Child0 = FlexNode<NoFlexElement>()
        rootChild2Child0.name = "rootChild2Child0"
        rootChild2Child0.style.width = 10.0
        rootChild2Child0.style.height = 10.0
        rootChild2.add(child: rootChild2Child0)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.width = 50.0
        rootChild3.style.height = 20.0
        root.add(child: rootChild3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(70.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild2Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(70.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsBaselineMultilineRowAndColumn() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .baseline
        root.style.flexWrap = .wrap
        root.style.width = 100.0
        root.style.height = 100.0
        
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
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 50.0
        rootChild1Child0.style.height = 10.0
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.width = 50.0
        rootChild2.style.height = 20.0
        root.add(child: rootChild2)
        
        let rootChild2Child0 = FlexNode<NoFlexElement>()
        rootChild2Child0.name = "rootChild2Child0"
        rootChild2Child0.style.width = 50.0
        rootChild2Child0.style.height = 10.0
        rootChild2.add(child: rootChild2Child0)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.width = 50.0
        rootChild3.style.height = 20.0
        root.add(child: rootChild3)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsCenterChildWithMarginBiggerThanParent() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.width = 52.0
        root.style.height = 52.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.alignItems = .center
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild1Child0"
        rootChild0Child0.style.margin.left = 10.0
        rootChild0Child0.style.margin.right = 10.0
        rootChild0Child0.style.width = 52.0
        rootChild0Child0.style.height = 52.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsFlexEndChildWithMarginBiggerThanParent() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.width = 52.0
        root.style.height = 52.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.alignItems = .flexEnd
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild1Child0"
        rootChild0Child0.style.margin.left = 10.0
        rootChild0Child0.style.margin.right = 10.0
        rootChild0Child0.style.width = 52.0
        rootChild0Child0.style.height = 52.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsFlexEndChildWithoutMarginBiggerThanParent() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.width = 52.0
        root.style.height = 52.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.alignItems = .flexEnd
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild1Child0"
        rootChild0Child0.style.width = 72.0
        rootChild0Child0.style.height = 72.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(-10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(52.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(-10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsCenterShouldSizeBasedOnContent() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignItems = .center
        root.style.margin.top = 20.0
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.justifyContent = .center
        rootChild0.style.flexShrink = 1.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild1Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexShrink = 1.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.width = 20.0
        rootChild0Child0Child0.style.height = 20.0
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsStretchShouldSizeBasedOnParent() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.margin.top = 20.0
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.justifyContent = .center
        rootChild0.style.flexShrink = 1.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild1Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexShrink = 1.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.width = 20.0
        rootChild0Child0Child0.style.height = 20.0
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsFlexStartWithShrinkingChildren() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 500.0
        root.style.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.alignItems = .flexStart
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild1Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexShrink = 1.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.flexGrow = 1.0
        rootChild0Child0Child0.style.flexShrink = 1.0
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsFlexStartWithStretchingChildren() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 500.0
        root.style.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild1Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexShrink = 1.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.flexGrow = 1.0
        rootChild0Child0Child0.style.flexShrink = 1.0
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignItemsFlexStartWithShrinkingChildrenWithStretch() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 500.0
        root.style.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.alignItems = .flexStart
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild1Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexShrink = 1.0
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.flexGrow = 1.0
        rootChild0Child0Child0.style.flexShrink = 1.0
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(500.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    
}
