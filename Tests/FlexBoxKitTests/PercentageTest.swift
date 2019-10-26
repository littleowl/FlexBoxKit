//
//  PercentageTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/19/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class PercentageTest: XCTestCase {
    
    func testPercentageWidthHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 30.0%
        rootChild0.style.dimensions.height = 30.0%
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(140.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentagePositionLeftTop() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 400.0
        root.style.dimensions.height = 400.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.position.left = 10.0%
        rootChild0.style.position.top = 20.0%
        rootChild0.style.dimensions.width = 45.0%
        rootChild0.style.dimensions.height = 55.0%
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(400.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(400.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(180.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(220.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(400.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(400.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(260.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(180.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(220.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentagePositionBottomRight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 500.0
        root.style.dimensions.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.position.right = .percent(20.0)
        rootChild0.style.position.bottom = .percent(10.0)
        rootChild0.style.dimensions.width = .percent(55.0)
        rootChild0.style.dimensions.height = .percent(15.0)
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-100.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(-50.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(275.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(500.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(125.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(-50.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(275.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageFlexBasis() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(50.0)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.flexBasis = .percent(25.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(125.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(75.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageFlexBasisCross() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(50.0)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        rootChild1.style.flexBasis = .percent(25.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(125.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageFlexBasisCrossMinHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.min.height = .percent(60.0)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 2.0
        rootChild1.style.min.height = .percent(10.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(140.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(140.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(140.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(140.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageFlexBasisMainMaxHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(10.0)
        rootChild0.style.max.height = .percent(60.0)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 4.0
        rootChild1.style.flexBasis = .percent(10.0)
        rootChild1.style.max.height = .percent(20.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(52.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(148.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(148.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(52.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(148.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageFlexBasisCrossMaxHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(10.0)
        rootChild0.style.max.height = .percent(60.0)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 4.0
        rootChild1.style.flexBasis = .percent(10.0)
        rootChild1.style.max.height = .percent(20.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageFlexBasisMainMaxWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(15.0)
        rootChild0.style.max.width = .percent(60.0)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 4.0
        rootChild1.style.flexBasis = .percent(10.0)
        rootChild1.style.max.width = .percent(20.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(120.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(40.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageFlexBasisCrossMaxWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(10.0)
        rootChild0.style.max.width = .percent(60.0)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 4.0
        rootChild1.style.flexBasis = .percent(15.0)
        rootChild1.style.max.width = .percent(20.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(160.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(40.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageFlexBasisMainMinWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(15.0)
        rootChild0.style.min.width = .percent(60.0)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 4.0
        rootChild1.style.flexBasis = .percent(10.0)
        rootChild1.style.min.width = .percent(20.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(120.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(80.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(80.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageFlexBasisCrossMinWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(10.0)
        rootChild0.style.min.width = .percent(60.0)
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 4.0
        rootChild1.style.flexBasis = .percent(15.0)
        rootChild1.style.min.width = .percent(20.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageMultipleNestedWithPaddingMarginAndPercentageValues() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.flexBasis = .percent(10.0)
        rootChild0.style.margin.left = 5.0
        rootChild0.style.margin.top = 5.0
        rootChild0.style.margin.right = 5.0
        rootChild0.style.margin.bottom = 5.0
        rootChild0.style.padding.left = 3.0
        rootChild0.style.padding.top = 3.0
        rootChild0.style.padding.right = 3.0
        rootChild0.style.padding.bottom = 3.0
        rootChild0.style.min.width = .percent(60.0)
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.margin.left = 5.0
        rootChild0Child0.style.margin.top = 5.0
        rootChild0Child0.style.margin.right = 5.0
        rootChild0Child0.style.margin.bottom = 5.0
        rootChild0Child0.style.padding.left = .percent(3.0)
        rootChild0Child0.style.padding.top = .percent(3.0)
        rootChild0Child0.style.padding.right = .percent(3.0)
        rootChild0Child0.style.padding.bottom = .percent(3.0)
        rootChild0Child0.style.dimensions.width = .percent(50.0)
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.margin.left = .percent(5.0)
        rootChild0Child0Child0.style.margin.top = .percent(5.0)
        rootChild0Child0Child0.style.margin.right = .percent(5.0)
        rootChild0Child0Child0.style.margin.bottom = .percent(5.0)
        rootChild0Child0Child0.style.padding.left = 3.0
        rootChild0Child0Child0.style.padding.top = 3.0
        rootChild0Child0Child0.style.padding.right = 3.0
        rootChild0Child0Child0.style.padding.bottom = 3.0
        rootChild0Child0Child0.style.dimensions.width = .percent(45.0)
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 4.0
        rootChild1.style.flexBasis = .percent(15.0)
        rootChild1.style.min.width = .percent(20.0)
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(5.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(190.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(48.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(8.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(8.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(92.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(10.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(36.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(6.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(58.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(142.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(5.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(5.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(190.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(48.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(90.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(8.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(92.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(25.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(46.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(36.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(6.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(58.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(142.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageMarginShouldCalculateBasedOnlyOnWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.margin.left = .percent(10.0)
        rootChild0.style.margin.top = .percent(10.0)
        rootChild0.style.margin.right = .percent(10.0)
        rootChild0.style.margin.bottom = .percent(10.0)
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.dimensions.width = 10.0
        rootChild0Child0.style.dimensions.height = 10.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(160.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(150.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentagePaddingShouldCalculateBasedOnlyOnWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.style.padding.left = .percent(10.0)
        rootChild0.style.padding.top = .percent(10.0)
        rootChild0.style.padding.right = .percent(10.0)
        rootChild0.style.padding.bottom = .percent(10.0)
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.dimensions.width = 10.0
        rootChild0Child0.style.dimensions.height = 10.0
        rootChild0.add(child: rootChild0Child0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(20.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(170.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(20.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageAbsolutePosition() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.left = .percent(30.0)
        rootChild0.style.position.top = .percent(10.0)
        rootChild0.style.dimensions.width = 10.0
        rootChild0.style.dimensions.height = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageWidthHeightUndefinedParentSize() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = .percent(50.0)
        rootChild0.style.dimensions.height = .percent(50.0)
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageWithinFlexGrow() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 350.0
        root.style.dimensions.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.dimensions.width = 100.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.dimensions.width = .percent(100.0)
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild2 = FlexNode<NoFlexElement>()
        rootChild2.name = "rootChild0"
        rootChild2.style.dimensions.width = 100.0
        root.add(child: rootChild2)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(350.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(250.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(350.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(250.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(100.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(150.0, rootChild1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild2.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild2.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild2.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentageContainerInWrappingContainer() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.justifyContent = .center
        root.style.alignItems = .center
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.style.flexDirection = .row
        rootChild0Child0.style.justifyContent = .center
        rootChild0Child0.style.dimensions.width = .percent(100.0)
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.name = "rootChild0Child0Child0"
        rootChild0Child0Child0.style.dimensions.width = 50.0
        rootChild0Child0Child0.style.dimensions.height = 50.0
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        let rootChild0Child0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child0Child1.name = "rootChild0Child0Child1"
        rootChild0Child0Child1.style.dimensions.width = 50.0
        rootChild0Child0Child1.style.dimensions.height = 50.0
        rootChild0Child0.add(child: rootChild0Child0Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0Child0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(200.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(75.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(100.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(50.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0Child1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentAbsolutePosition() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.dimensions.width = 60.0
        root.style.dimensions.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexDirection = .row
        rootChild0.style.positionType = .absolute
        rootChild0.style.position.left = .percent(50.0)
        rootChild0.style.dimensions.width = .percent(100.0)
        rootChild0.style.dimensions.height = 50.0
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.name = "rootChild1"
        rootChild0Child0.style.dimensions.width = .percent(100.0)
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child1.name = "rootChild0Child1"
        rootChild0Child1.style.dimensions.width = .percent(100.0)
        rootChild0.add(child: rootChild0Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(30.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(-60.0, rootChild0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(50.0, rootChild0Child1.layout.dimensions.height, accuracy: 0.00001)
    }
}
