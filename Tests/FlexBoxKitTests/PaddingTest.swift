//
//  PaddingTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/17/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class PaddingTest: XCTestCase {
    func testPaddingNoSize() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.padding.left = 10.0
        root.style.padding.top = 10.0
        root.style.padding.right = 10.0
        root.style.padding.bottom = 10.0
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, root.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testPaddingContainerMatchChild() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.border.left = 10.0
        root.style.border.top = 10.0
        root.style.border.right = 10.0
        root.style.border.bottom = 10.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 10.0
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(30.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(30.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPaddingFlexChild() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.border.left = 10.0
        root.style.border.top = 10.0
        root.style.border.right = 10.0
        root.style.border.bottom = 10.0
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.dimensions.width = 10.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPaddingStretchChild() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.border.left = 10.0
        root.style.border.top = 10.0
        root.style.border.right = 10.0
        root.style.border.bottom = 10.0
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
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPaddingCenterChild() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.border.start = 10.0
        root.style.border.end = 20.0
        root.style.border.bottom = 20.0
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
        
        XCTAssertEqual(40.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(35.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(35.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testChildWithPaddingAlignEnd() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .flexEnd
        root.style.alignItems = .flexEnd
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.padding.left = 20.0
        rootChild0.style.padding.top = 20.0
        rootChild0.style.padding.right = 20.0
        rootChild0.style.padding.bottom = 20.0
        rootChild0.style.dimensions.width = 100.0
        rootChild0.style.dimensions.height = 100.0
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
}
