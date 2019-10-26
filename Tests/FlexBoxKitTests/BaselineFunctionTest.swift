//
//  BaselineFunctionTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class BaselineFunctionTest: XCTestCase {
    
    func testAlignBaselineCustomerFunc() {
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
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        
        root.add(child: rootChild1)
        
        let baseFunc: BaselineFunc = { task in
            return 10.0
        }
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 50.0
        rootChild1Child0.style.height = 20.0
        rootChild1Child0.nodeType = .test//.baselineFunc = baseFunc
        
        rootChild1.add(child: rootChild1Child0)
        
        let context =  ProcessingContext()
        context[.test] = BaselineHolder(closure: baseFunc)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
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
        XCTAssertEqual(20.0, rootChild1Child0.layout.dimensions.height, accuracy: 0.00001)
    }
}
