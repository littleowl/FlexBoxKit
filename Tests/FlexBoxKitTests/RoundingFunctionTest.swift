//
//  RoundingFunctionTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//



import XCTest
@testable import FlexBoxKit

// for brevity
let roundFunc = roundValueToPixelGrid

class RoundingFunctionTest: XCTestCase {
    
    func testRoundingValue() {
        // Test that whole numbers are rounded to whole despite ceil/floor flags
        XCTAssertEqual(6.0, roundFunc(6.000001, 2.0, false, false), accuracy: 0.00001)
        XCTAssertEqual(6.0, roundFunc(6.000001, 2.0, true, false), accuracy: 0.00001)
        XCTAssertEqual(6.0, roundFunc(6.000001, 2.0, false, true), accuracy: 0.00001)
        XCTAssertEqual(6.0, roundFunc(5.999999, 2.0, false, false), accuracy: 0.00001)
        XCTAssertEqual(6.0, roundFunc(5.999999, 2.0, true, false), accuracy: 0.00001)
        XCTAssertEqual(6.0, roundFunc(5.999999, 2.0, false, true), accuracy: 0.00001)
        // Same tests for negative numbers
        XCTAssertEqual(-6.0, roundFunc(-6.000001, 2.0, false, false), accuracy: 0.00001)
        XCTAssertEqual(-6.0, roundFunc(-6.000001, 2.0, true, false), accuracy: 0.00001)
        XCTAssertEqual(-6.0, roundFunc(-6.000001, 2.0, false, true), accuracy: 0.00001)
        XCTAssertEqual(-6.0, roundFunc(-5.999999, 2.0, false, false), accuracy: 0.00001)
        XCTAssertEqual(-6.0, roundFunc(-5.999999, 2.0, true, false), accuracy: 0.00001)
        XCTAssertEqual(-6.0, roundFunc(-5.999999, 2.0, false, true), accuracy: 0.00001)
        // Test that numbers with fraction are rounded correctly accounting for ceil/floor flags
        XCTAssertEqual(6.0, roundFunc(6.01, 2.0, false, false), accuracy: 0.00001)
        XCTAssertEqual(6.5, roundFunc(6.01, 2.0, true, false), accuracy: 0.00001)
        XCTAssertEqual(6.0, roundFunc(6.01, 2.0, false, true), accuracy: 0.00001)
        XCTAssertEqual(6.0, roundFunc(5.99, 2.0, false, false), accuracy: 0.00001)
        XCTAssertEqual(6.0, roundFunc(5.99, 2.0, true, false), accuracy: 0.00001)
        XCTAssertEqual(5.5, roundFunc(5.99, 2.0, false, true), accuracy: 0.00001)
        // Same tests for negative numbers
        XCTAssertEqual(-6.0, roundFunc(-6.01, 2.0, false, false), accuracy: 0.00001)
        XCTAssertEqual(-6.0, roundFunc(-6.01, 2.0, true, false), accuracy: 0.00001)
        XCTAssertEqual(-6.5, roundFunc(-6.01, 2.0, false, true), accuracy: 0.00001)
        XCTAssertEqual(-6.0, roundFunc(-5.99, 2.0, false, false), accuracy: 0.00001)
        XCTAssertEqual(-5.5, roundFunc(-5.99, 2.0, true, false), accuracy: 0.00001)
        XCTAssertEqual(-6.0, roundFunc(-5.99, 2.0, false, true), accuracy: 0.00001)
    }
    
    func testConsistentRoundingDuringRepeatedLayouts() {
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { measureTask in
            return Size.init(width: 10.0, height: 10.0)
        })
        
        let config = Config.init()
        config.pointScaleFactor = 2.0
        let root = FlexNode<NoFlexElement>(config: config)
        root.name = "root"
        root.style.margin.top = -1.49
        root.style.dimensions.width = 500.0
        root.style.dimensions.height = 500.0
        
        let rootChild0 = FlexNode<NoFlexElement>(config: config)
        rootChild0.name = "rootChild0"
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>(config: config)
        rootChild0Child0.name = "rootChild0Child0"
        rootChild0Child0.nodeType = .test
//        rootChild0Child0.measureFunc = { measureTask in
//            return Size.init(width: 10.0, height: 10.0)
//        }
        rootChild0.add(child: rootChild0Child0)
        
        for i in 0..<5 {
            root.style.margin.left = .point(Float(i) + 1.0)
            
            root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
            XCTAssertEqual(10.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        }
        
    }
}
