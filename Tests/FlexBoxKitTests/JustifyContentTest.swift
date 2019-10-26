//
//  JustifyContentTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/17/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class JustifyContentTest: XCTestCase {
    
    func testJustifyContentRowFlexStart() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(92.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(82.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(72.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentRowFlexEnd() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.justifyContent = .flexEnd
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(72.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(82.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(92.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentRowCenter() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.justifyContent = .center
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(46.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(56.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(56.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(46.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentRowSpaceBetween() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.justifyContent = .spaceBetween
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(46.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(92.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(92.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(46.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentRowSpaceAround() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.justifyContent = .spaceAround
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(12.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(46.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(46.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(12.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }

    func testJustifyContentColumnFlexStart() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentColumnFlexEnd() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.justifyContent = .flexEnd
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(82.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(92.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(82.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(92.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentColumnCenter() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.justifyContent = .center
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(36.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(46.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(56.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(36.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(46.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(56.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentColumnSpaceBetween() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.justifyContent = .spaceBetween
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(46.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(92.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(46.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(92.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentColumnSpaceAround() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.justifyContent = .spaceAround
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(12.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(46.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(12.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(46.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentRowMinWidthAndMargin() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.justifyContent = .center
        root.style.margin.left = 100.0
        root.style.min.width = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 20.0
        rootChild0.style.dimensions.height = 20.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(100.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(15.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(100.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(15.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentRowMaxWidthAndMargin() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.justifyContent = .center
        root.style.margin.left = 100.0
        root.style.dimensions.width = 100.0
        root.style.max.width = 80.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 20.0
        rootChild0.style.dimensions.height = 20.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(100.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(100.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentRowMinHeightAndMargin() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.margin.top = 100.0
        root.style.min.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 20.0
        rootChild0.style.dimensions.height = 20.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(15.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(15.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentRowMaxHeightAndMargin() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.margin.top = 100.0
        root.style.dimensions.height = 100.0
        root.style.max.height = 80.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 20.0
        rootChild0.style.dimensions.height = 20.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentColumnSpaceEvenly() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .spaceEvenly
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(18.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(46.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(74.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(18.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(46.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(74.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentRowSpaceEvenly() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.justifyContent = .spaceEvenly
        root.style.dimensions.width = 102.0
        root.style.dimensions.height = 102.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(26.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(51.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(77.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(102.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(77.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(51.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(26.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentMinWidthWithPaddingChildWidthGreaterThanParent() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignContent = .stretch
        root.style.dimensions.width = 1000.0
        root.style.dimensions.height = 1584.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.alignContent = .stretch
        
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexDirection = .row
        rootChild0Child0.style.justifyContent = .center
        rootChild0Child0.style.alignContent = .stretch
        rootChild0Child0.style.padding.left = 100.0
        rootChild0Child0.style.padding.right = 100.0
        rootChild0Child0.style.min.width = 400.0
        
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.flexDirection = .row
        rootChild0Child0Child0.style.alignContent = .stretch
        rootChild0Child0Child0.style.dimensions.width = 300.0
        rootChild0Child0Child0.style.dimensions.height = 100.0
        
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1000.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(1584.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1000.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)

        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1000.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(1584.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1000.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(500.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testJustifyContentMinWidthWithPaddingChildWidthLowerThanParent() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignContent = .stretch
        root.style.dimensions.width = 1080.0
        root.style.dimensions.height = 1584.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.alignContent = .stretch
        
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexDirection = .row
        rootChild0Child0.style.justifyContent = .center
        rootChild0Child0.style.alignContent = .stretch
        rootChild0Child0.style.padding.left = 100.0
        rootChild0Child0.style.padding.right = 100.0
        rootChild0Child0.style.min.width = 400.0
        
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.flexDirection = .row
        rootChild0Child0Child0.style.alignContent = .stretch
        rootChild0Child0Child0.style.dimensions.width = 199.0
        rootChild0Child0Child0.style.dimensions.height = 100.0
        
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(1584.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(101.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(199.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(1584.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(680.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(400.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(101.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(199.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
    }
}
