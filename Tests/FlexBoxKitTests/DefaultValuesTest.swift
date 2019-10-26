//
//  DefaultValuesTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class DefaultValuesTest: XCTestCase {
    
    func testAssertDefaultValues() {
        let root = FlexNode<NoFlexElement>()
        XCTAssertEqual(0, root.children.count)

        XCTAssertEqual(Direction.inherit, root.style.direction)
        XCTAssertEqual(FlexDirection.column, root.style.flexDirection)
        XCTAssertEqual(Justify.flexStart, root.style.justifyContent)
        XCTAssertEqual(Align.flexStart, root.style.alignContent)
        XCTAssertEqual(Align.stretch, root.style.alignItems)
        XCTAssertEqual(Align.auto, root.style.alignSelf)
        XCTAssertEqual(Position.relative, root.style.positionType)
        XCTAssertEqual(Wrap.noWrap, root.style.flexWrap)
        XCTAssertEqual(Overflow.visible, root.style.overflow)
        XCTAssertEqual(nil, root.style.flexGrow)
        XCTAssertEqual(0.0, root.style.flexShrink)
        XCTAssertEqual(Value.auto, root.style.flexBasis)
        
        XCTAssertEqual(Value.undefined, root.style.position.left)
        XCTAssertEqual(Value.undefined, root.style.position.top)
        XCTAssertEqual(Value.undefined, root.style.position.right)
        XCTAssertEqual(Value.undefined, root.style.position.bottom)
        XCTAssertEqual(Value.undefined, root.style.position.start)
        XCTAssertEqual(Value.undefined, root.style.position.end)
        XCTAssertEqual(Value.undefined, root.style.position.horizontal)
        XCTAssertEqual(Value.undefined, root.style.position.vertical)
        XCTAssertEqual(Value.undefined, root.style.position.all)
        
        XCTAssertEqual(Value.undefined, root.style.margin.left)
        XCTAssertEqual(Value.undefined, root.style.margin.top)
        XCTAssertEqual(Value.undefined, root.style.margin.right)
        XCTAssertEqual(Value.undefined, root.style.margin.bottom)
        XCTAssertEqual(Value.undefined, root.style.margin.start)
        XCTAssertEqual(Value.undefined, root.style.margin.end)
        XCTAssertEqual(Value.undefined, root.style.margin.horizontal)
        XCTAssertEqual(Value.undefined, root.style.margin.vertical)
        XCTAssertEqual(Value.undefined, root.style.margin.all)
        
        XCTAssertEqual(Value.undefined, root.style.padding.left)
        XCTAssertEqual(Value.undefined, root.style.padding.top)
        XCTAssertEqual(Value.undefined, root.style.padding.right)
        XCTAssertEqual(Value.undefined, root.style.padding.bottom)
        XCTAssertEqual(Value.undefined, root.style.padding.start)
        XCTAssertEqual(Value.undefined, root.style.padding.end)
        XCTAssertEqual(Value.undefined, root.style.padding.horizontal)
        XCTAssertEqual(Value.undefined, root.style.padding.vertical)
        XCTAssertEqual(Value.undefined, root.style.padding.all)
        
        XCTAssertEqual(Value.undefined, root.style.border.left)
        XCTAssertEqual(Value.undefined, root.style.border.top)
        XCTAssertEqual(Value.undefined, root.style.border.right)
        XCTAssertEqual(Value.undefined, root.style.border.bottom)
        XCTAssertEqual(Value.undefined, root.style.border.start)
        XCTAssertEqual(Value.undefined, root.style.border.end)
        XCTAssertEqual(Value.undefined, root.style.border.horizontal)
        XCTAssertEqual(Value.undefined, root.style.border.vertical)
        XCTAssertEqual(Value.undefined, root.style.border.all)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.right, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.bottom, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, root.layout.margin.start, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.margin.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.margin.end, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.margin.bottom, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, root.layout.padding.start, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.padding.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.padding.end, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.padding.bottom, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, root.layout.border.start, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.border.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.border.end, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.border.bottom, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, root.layout.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.height, accuracy: 0.00001)
        
        XCTAssertEqual(Direction.inherit, root.layout.direction)


    }
    
}
