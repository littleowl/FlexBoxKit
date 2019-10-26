//
//  InfiniteDimensionTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class InfiniteDimensionTest: XCTestCase {
    
    func testPercentAbsolutePositionInfiniteHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.width = 300.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 300.0
        rootChild0.style.height = 300.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.positionType = .absolute
        rootChild1.style.position.left = .percent(20.0)
        rootChild1.style.position.top = .percent(20.0)
        rootChild1.style.width = .percent(20.0)
        rootChild1.style.height = .percent(20.0)
        
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(60.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
    
    func testPercentAbsolutePositionInfiniteWidth() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.height = 300.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 300.0
        rootChild0.style.height = 300.0
        
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.positionType = .absolute
        rootChild1.style.position.left = .percent(20.0)
        rootChild1.style.position.top = .percent(20.0)
        rootChild1.style.width = .percent(20.0)
        rootChild1.style.height = .percent(20.0)
        
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(300.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(60.0, rootChild1.layout.dimensions.height, accuracy: 0.00001)
    }
}

