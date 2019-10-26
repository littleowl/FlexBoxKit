//
//  AlignContentTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/18/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class AlignContentTest: XCTestCase {
    
    func testAlignContentFlexStart() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 130.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 10.0

        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        rootChild3.style.dimensions.height = 10.0

        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        rootChild4.style.dimensions.height = 10.0

        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(130.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(130.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentFlexStartWithoutHeightOnChildren() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        rootChild3.style.dimensions.height = 10.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentFlexStartWithFlex() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 120.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(0.0)
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.flexBasis = .percent(0.0)
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.flexGrow = 1.0
        rootChild3.style.flexShrink = 1.0
        rootChild3.style.flexBasis = .percent(0.0)
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentFlexEnd() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignContent = .flexEnd
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 10.0

        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        rootChild3.style.dimensions.height = 10.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        rootChild4.style.dimensions.height = 10.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(30.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretch() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentSpaceBetween() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .spaceBetween
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 130.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        rootChild3.style.dimensions.height = 10.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        rootChild4.style.dimensions.height = 10.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(130.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(45.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(45.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)

        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(130.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(30.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(80.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(45.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(30.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(45.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(80.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentSpaceAround() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .spaceAround
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 140.0
        root.style.dimensions.height = 120.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        rootChild0.style.dimensions.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        rootChild2.style.dimensions.height = 10.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        rootChild3.style.dimensions.height = 10.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        rootChild4.style.dimensions.height = 10.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(140.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(15.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(15.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(55.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(55.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(95.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(140.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(15.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(15.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(55.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(55.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(95.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchRow() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)

        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(100.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchRowWithChildren() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexShrink = 1.0
        rootChild0Child0.style.flexBasis = .percent(0.0)
        
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchRowWithFlex() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.flexShrink = 1.0
        rootChild1.style.flexBasis = .percent(0.0)
        rootChild1.style.dimensions.width = 50.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.flexGrow = 1.0
        rootChild3.style.flexShrink = 1.0
        rootChild3.style.flexBasis = .percent(0.0)
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
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
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchRowWithFlexNoShrink() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.flexShrink = 1.0
        rootChild1.style.flexBasis = .percent(0.0)
        rootChild1.style.dimensions.width = 50.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.flexGrow = 1.0
        rootChild3.style.flexBasis = .percent(0.0)
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
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
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchRowWithMargin() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.margin.left = 10.0
        rootChild1.style.margin.top = 10.0
        rootChild1.style.margin.right = 10.0
        rootChild1.style.margin.bottom = 10.0
        rootChild1.style.dimensions.width = 50.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.margin.left = 10.0
        rootChild3.style.margin.top = 10.0
        rootChild3.style.margin.right = 10.0
        rootChild3.style.margin.bottom = 10.0
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchRowWithPadding() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.padding.left = 10.0
        rootChild1.style.padding.top = 10.0
        rootChild1.style.padding.right = 10.0
        rootChild1.style.padding.bottom = 10.0
        rootChild1.style.dimensions.width = 50.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.padding.left = 10.0
        rootChild3.style.padding.top = 10.0
        rootChild3.style.padding.right = 10.0
        rootChild3.style.padding.bottom = 10.0
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchRowWithSingleRow() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        
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
    
    func testAlignContentStretchRowWithFixedHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.dimensions.height = 60.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchRowWithMaxHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.max.height = 20.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchRowWithMinHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 150.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.dimensions.width = 50.0
        rootChild1.style.min.height = 80.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.width = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.width = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.width = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchColumn() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.alignContent = .stretch
        root.style.flexWrap = .wrap
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 150.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.height = 50.0
        
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexShrink = 1.0
        rootChild0Child0.style.flexBasis = .percent(0.0)
        
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.flexShrink = 1.0
        rootChild1.style.flexBasis = .percent(0.0)
        rootChild1.style.dimensions.height = 50.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.dimensions.height = 50.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.dimensions.height = 50.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.dimensions.height = 50.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(150.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
    }
    
    func testAlignContentStretchIsNotOverridingAlignItems() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignContent = .stretch
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.alignContent = .stretch
        rootChild0.style.alignItems = .center
        rootChild0.style.dimensions.width = 100.0
        rootChild0.style.dimensions.height = 100.0
        
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.alignContent = .stretch
        rootChild0Child0.style.dimensions.width = 10.0
        rootChild0Child0.style.dimensions.height = 10.0
        
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(45.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(45.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
    }
}
