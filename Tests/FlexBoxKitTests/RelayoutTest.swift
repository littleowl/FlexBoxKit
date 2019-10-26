//
//  RelayoutTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class RelayoutTest: XCTestCase {
    
    func testDontCacheComputedFlexBasisBetweenLayouts() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.flexBasis = .percent(100.0)
        root.add(child: rootChild0)
        
        root.calculateLayout(width: 100.0, height: nil, direction: .leftToRight)
        root.calculateLayout(width: 100.0, height: 100.0, direction: .leftToRight)
        
        XCTAssertEqual(100.0, rootChild0.layout.height, accuracy: 0.00001)
    }
    
    func testRecalculateResolvedDimonsionOnchange() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"

        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.style.min.height = 10.0
        rootChild0.style.max.height = 10.0
        root.add(child: rootChild0)

        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(10.0, rootChild0.layout.height, accuracy: 0.00001)

        rootChild0.style.min.height = .undefined
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)

        XCTAssertEqual(0.0, rootChild0.layout.height, accuracy: 0.00001)
    }

}
