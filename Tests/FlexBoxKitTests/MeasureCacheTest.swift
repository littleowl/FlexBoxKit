//
//  MeasureCacheTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class MeasureCacheTest: XCTestCase {
    
    func testMeasureOnceSingleFlexibleChild() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        var measureCount = 0
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { task in
            measureCount += 1
            return Size.init(
                width: task.widthMode == .undefined ? 10.0 : (task.width ?? 10.0),
                height: task.heightMode == .undefined ? 10.0 : (task.height ?? 10.0))
        })
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        rootChild0.nodeType = .test
//        rootChild0.measureFunc = { task in
//            measureCount += 1
//            return Size.init(
//                width: task.widthMode == .undefined ? 10.0 : (task.width ?? 10.0),
//                height: task.heightMode == .undefined ? 10.0 : (task.height ?? 10.0))
//        }
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight, processingContext: context)
        
        XCTAssertEqual(1, measureCount)
    }
    
    func testRemeasureWithSameExactWidthLargerThanNeededHeight() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        
        var measureCount = 0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.nodeType = .test
        
        let context =  ProcessingContext()
        context[.test] = MeasureHolder(closure: { task in
            measureCount += 1
            return Size.init(
                width: (task.widthMode == .undefined || task.widthMode == .atMost) && task.width > 10.0 ? 10.0 : (task.width ?? 10.0),
                height: (task.heightMode == .undefined || task.heightMode == .atMost) && task.height > 10.0 ? 10.0 : (task.height ?? 10.0))
        })
        
        root.add(child: rootChild0)
        
        root.calculateLayout(width: 100.0, height: 100.0, direction: .leftToRight, processingContext: context)
        root.calculateLayout(width: 100.0, height: 50.0, direction: .leftToRight, processingContext: context)

        XCTAssertEqual(1, measureCount)
    }
}
