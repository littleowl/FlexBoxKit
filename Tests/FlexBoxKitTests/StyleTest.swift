//
//  StyleTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class StyleTest: XCTestCase {
    
    func testCopyStyleSame() {
        let node0 = FlexNode<NoFlexElement>()
        let node1 = FlexNode<NoFlexElement>()
        
        XCTAssertFalse(node0.isDirty)
        
        node0.style = node1.style
        
        XCTAssertFalse(node0.isDirty)
    }
    
    func testCopyStyleModified() {
        let node0 = FlexNode<NoFlexElement>()
        XCTAssertFalse(node0.isDirty)
        XCTAssertEqual(FlexDirection.column, node0.style.flexDirection)
        XCTAssertTrue(node0.style.max.height.unit == .undefined)
        
        let node1 = FlexNode<NoFlexElement>()
        node1.style.flexDirection = .row
        node1.style.max.height = 10.0
        
        node0.style = node1.style
        
        XCTAssertTrue(node0.isDirty)
        XCTAssertEqual(FlexDirection.row, node0.style.flexDirection)
        XCTAssertEqual(10.0, node0.style.max.height.value!, accuracy: 0.00001)
        
    }
    
    func testCopyStyleModifiedSame() {
        let node0 = FlexNode<NoFlexElement>()
        node0.style.flexDirection = .row
        node0.style.max.height = 10.0
        node0.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        XCTAssertFalse(node0.isDirty)
        
        let node1 = FlexNode<NoFlexElement>()
        node1.style.flexDirection = .row
        node1.style.max.height = 10.0
        
        node0.style = node1.style
        
        XCTAssertFalse(node0.isDirty)
        
    }
    
    func testInitialiseFlexShrinkFlexGrow() {
        let node0 = FlexNode<NoFlexElement>()
        node0.style.flexShrink = 1.0
        XCTAssertEqual(1.0, node0.style.flexShrink)

        node0.style.flexShrink = nil
        node0.style.flexGrow = 3.0
        XCTAssertEqual(nil, node0.style.flexShrink)
        XCTAssertEqual(3.0, node0.style.flexGrow)

        node0.style.flexGrow = nil
        node0.style.flexShrink = 3.0
        XCTAssertEqual(nil, node0.style.flexGrow)
        XCTAssertEqual(3.0, node0.style.flexShrink)
        
    }
    
    func testStyleSize() {
        let size = MemoryLayout<FlexBox>.size
        print("style size: \(size)")
    }
    
}
