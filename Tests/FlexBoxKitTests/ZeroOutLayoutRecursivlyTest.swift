//
//  ZeroOutLayoutRecursivlyTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class ZeroOutLayoutRecursivlyTest: XCTestCase {
    
    func testZeroOutLayout() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.dimensions.width = 200.0
        root.style.dimensions.height = 200.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 100.0
        rootChild0.style.height = 100.0
        rootChild0.style.margin.top = 10.0
        rootChild0.style.padding.top = 10.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(10.0, rootChild0.layout.margin.top, accuracy: 0.00001)
        XCTAssertEqual(10.0, rootChild0.layout.padding.top, accuracy: 0.00001)
        
        rootChild0.style.display = .none
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, rootChild0.layout.margin.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.padding.top, accuracy: 0.00001)
        
    }
}
