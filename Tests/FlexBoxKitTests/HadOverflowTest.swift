//
//  HadOverflowTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/21/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class HadOverflowTest: XCTestCase {
    
    func testHadOverflowTestsChildrenOverflowNoWrapAndNoFlexChildren() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 200.0
        root.style.height = 100.0
        root.style.flexWrap = .noWrap
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 80.0
        rootChild0.style.height = 40.0
        rootChild0.style.margin.top = 10.0
        rootChild0.style.margin.bottom = 15.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 80.0
        rootChild1.style.height = 40.0
        rootChild1.style.margin.bottom = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: 200, height: 100, direction: .leftToRight)
        
        XCTAssertTrue(root.layout.hasOverflow)
    }
    
    func testHadOverflowTestsSpacingOverflowNoWrapAndNoFlexChildren() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 200.0
        root.style.height = 100.0
        root.style.flexWrap = .noWrap
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 80.0
        rootChild0.style.height = 40.0
        rootChild0.style.margin.top = 10.0
        rootChild0.style.margin.bottom = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 80.0
        rootChild1.style.height = 40.0
        rootChild1.style.margin.bottom = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: 200, height: 100, direction: .leftToRight)
        
        XCTAssertTrue(root.layout.hasOverflow)
    }
    
    func testHadOverflowTestsNoOverflowNoWrapAndFlexChildren() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 200.0
        root.style.height = 100.0
        root.style.flexWrap = .noWrap
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 80.0
        rootChild0.style.height = 40.0
        rootChild0.style.margin.top = 10.0
        rootChild0.style.margin.bottom = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 80.0
        rootChild1.style.height = 40.0
        rootChild1.style.margin.bottom = 5.0
        rootChild1.style.flexShrink = 1.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: 200, height: 100, direction: .leftToRight)
        
        XCTAssertFalse(root.layout.hasOverflow)
    }
    
    func testHadOverflowTestsHadOverflowGetsResetIfNoLongerValid() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 200.0
        root.style.height = 100.0
        root.style.flexWrap = .noWrap
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 80.0
        rootChild0.style.height = 40.0
        rootChild0.style.margin.top = 10.0
        rootChild0.style.margin.bottom = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 80.0
        rootChild1.style.height = 40.0
        rootChild1.style.margin.bottom = 5.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: 200, height: 100, direction: .leftToRight)
        
        XCTAssertTrue(root.layout.hasOverflow)
        
        rootChild1.style.flexShrink = 1.0
        
        root.calculateLayout(width: 200, height: 100, direction: .leftToRight)
        
        XCTAssertFalse(root.layout.hasOverflow)
    }
    
    func testHadOverflowTestsSpacingOverflowInNestedNodes() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.width = 200.0
        root.style.height = 100.0
        root.style.flexWrap = .noWrap
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 80.0
        rootChild0.style.height = 40.0
        rootChild0.style.margin.top = 10.0
        rootChild0.style.margin.bottom = 10.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 80.0
        rootChild1.style.height = 40.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1Child0.style.width = 80.0
        rootChild1Child0.style.height = 40.0
        rootChild1Child0.style.margin.bottom = 5.0
        rootChild1.add(child: rootChild1Child0)
        
        root.calculateLayout(width: 200, height: 100, direction: .leftToRight)
        
        XCTAssertTrue(root.layout.hasOverflow)
    }
}
