//
//  RoundingTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class RoundingTest: XCTestCase {
    
    func testRoundingFlexBasisFlexGrowRowWidthOf100() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(33.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(33.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(34.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(67.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(33.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingFlexBasisFlexGrowRowPrimeNumberWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.width = 113.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        
        root.add(child: rootChild2)
        
        let rootChild3 = FlexNode<NoFlexElement>()
        rootChild3.name = "rootChild3"
        rootChild3.style.flexGrow = 1.0
        
        root.add(child: rootChild3)
        
        let rootChild4 = FlexNode<NoFlexElement>()
        rootChild4.name = "rootChild4"
        rootChild4.style.flexGrow = 1.0
        
        root.add(child: rootChild4)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(23.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(23.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(22.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(23.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(68.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(22.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(23.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(23.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(68.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(22.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(45.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(23.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(23.0, rootChild3.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild3.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(22.0, rootChild3.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild3.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild4.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild4.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(23.0, rootChild4.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild4.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingFlexBasisFlexShrinkRow() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.width = 101.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexShrink = 1.0
        rootChild0.style.flexBasis = 100.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexBasis = 25.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexBasis = 25.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(101.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(51.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(51.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(76.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(101.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(51.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(25.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingFlexBasisOverridesMainSize() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 100.0
        root.style.height = 113.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = 50.0
        rootChild0.style.height = 20.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        rootChild2.style.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingTotalFractial() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 87.4
        root.style.height = 113.4
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 0.7
        rootChild0.style.flexBasis = 50.3
        rootChild0.style.height = 20.3
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.6
        rootChild1.style.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.1
        rootChild2.style.height = 10.7
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(59.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(59.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(31.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
//        XCTAssertEqual(30.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild2.layout.position.top, accuracy: 0.00001)
//        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(59.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(59.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(31.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
//        XCTAssertEqual(30.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild2.layout.position.top, accuracy: 0.00001)
//        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingTotalFractialNested() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 87.4
        root.style.height = 113.4
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 0.7
        rootChild0.style.flexBasis = 50.3
        rootChild0.style.height = 20.3
        
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexGrow = 1.0
        rootChild0Child0.style.flexBasis = 0.3
        rootChild0Child0.style.position.bottom = 13.3
        rootChild0Child0.style.height = 9.9
        
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.flexGrow = 4.0
        rootChild0Child1.style.flexBasis = 0.3
        rootChild0Child1.style.position.top = 13.3
        rootChild0Child1.style.height = 1.1
        
        rootChild0.add(child: rootChild0Child1)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.6
        rootChild1.style.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.1
        rootChild2.style.height = 10.7
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(59.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(-13.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(12.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(48.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
//        XCTAssertEqual(47.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(59.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(31.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        //        XCTAssertEqual(30.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild2.layout.position.top, accuracy: 0.00001)
        //        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(59.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(-13.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(12.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(48.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
//        XCTAssertEqual(47.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)

        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(59.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(31.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        //        XCTAssertEqual(30.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(90.0, rootChild2.layout.position.top, accuracy: 0.00001)
        //        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(87.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingTotalFractialInput1() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 100.0
        root.style.height = 113.4
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = 50.0
        rootChild0.style.height = 20.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        rootChild2.style.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingTotalFractialInput2() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 100.0
        root.style.height = 113.6
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = 50.0
        rootChild0.style.height = 20.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        rootChild2.style.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(114.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(65.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(65.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(114.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(65.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(65.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingTotalFractialInput3() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.position.top = 0.3
        root.style.width = 100.0
        root.style.height = 113.4
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = 50.0
        rootChild0.style.height = 20.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        rootChild2.style.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(114.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(65.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(114.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(65.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingTotalFractialInput4() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.position.top = 0.7
        root.style.width = 100.0
        root.style.height = 113.4
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = 50.0
        rootChild0.style.height = 20.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        rootChild2.style.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(1.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(1.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(113.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(64.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(89.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingInnerNodeControversyHorizontal() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.width = 320.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.height = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.height = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.flexGrow = 1.0
        rootChild1Child0.style.height = 10.0
        
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        rootChild2.style.height = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(320.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(107.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(213.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(320.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(213.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(107.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingInnerNodeControversyVertical() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.height = 320.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.width = 10.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.width = 10.0
        
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.flexGrow = 1.0
        rootChild1Child0.style.width = 10.0
        
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        rootChild2.style.width = 10.0
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(213.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(213.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testRoundingInnerNodeControversyCombined() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.width = 640.0
        root.style.height = 320.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.height = .percent(100.0)
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.height = .percent(100.0)
        
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.flexGrow = 1.0
        rootChild1Child0.style.width = .percent(100.0)
        
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child1 = FlexNode<NoFlexElement>()
        rootChild1Child1.name = "rootChild1Child1"
        rootChild1Child1.style.flexGrow = 1.0
        rootChild1Child1.style.width = .percent(100.0)
        
        rootChild1.add(child: rootChild1Child1)
        
        let rootChild1Child1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child1Child0.name = "rootChild1Child1Child0"
        rootChild1Child1Child0.style.flexGrow = 1.0
        rootChild1Child1Child0.style.width = .percent(100.0)
        
        rootChild1Child1.add(child: rootChild1Child1Child0)
        
        let rootChild1Child2 = FlexNode<NoFlexElement>()
        rootChild1Child2.name = "rootChild1Child2"
        rootChild1Child2.style.flexGrow = 1.0
        rootChild1Child2.style.width = .percent(100.0)
        
        rootChild1.add(child: rootChild1Child2)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild2"
        rootChild2.style.flexGrow = 1.0
        rootChild2.style.height = .percent(100.0)
        
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(640.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(213.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(213.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(213.0, rootChild1Child2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1Child2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild1Child2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(427.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(213.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(640.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(427.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(213.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(213.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(106.0, rootChild1Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(213.0, rootChild1Child2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(214.0, rootChild1Child2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(107.0, rootChild1Child2.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(213.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(320.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
}


