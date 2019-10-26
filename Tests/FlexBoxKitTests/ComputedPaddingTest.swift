//
//  ComputedPaddingTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class ComputedPaddingTest: XCTestCase {
    
    func testComputedLayoutPadding() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .column
        root.style.dimensions.width = 100.0
        root.style.dimensions.height = 100.0
        root.style.padding.start = .percent(10.0)
        
        root.calculateLayout(width: 100.0, height: 100.0, direction: .leftToRight)
        
        XCTAssertEqual(10.0, root.layout.padding.start, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.padding.end, accuracy: 0.00001)
        XCTAssertEqual(10.0, root.layout.padding.left(from: .leftToRight), accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.padding.right(from: .leftToRight), accuracy: 0.00001)
        
        root.calculateLayout(width: 100.0, height: 100.0, direction: .rightToLeft)
        XCTAssertEqual(10.0, root.layout.padding.start, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.padding.end, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.padding.left(from: .rightToLeft), accuracy: 0.00001)
        XCTAssertEqual(10.0, root.layout.padding.right(from: .rightToLeft), accuracy: 0.00001)
        
    }
    
    func testPaddingSideOverridesHorizontalAndVertical() {
        let edges: [Edge] = [.top, .bottom, .start, .end, .left, .right]
        
        for edge in 0..<2 {
            let edgeValue = Float(edge)
            for edge in edges {
                let horizontalOrVertical = edge.horizontalOrVertical
                
                let root = FlexNode<NoFlexElement>()
                root.style.width = 100.0
                root.style.height = 100.0
                root.style.padding[horizontalOrVertical] = 10.0
                root.style.padding[edge] = .point(edgeValue)
                
                root.calculateLayout(width: 100.0, height: 100.0, direction: .leftToRight)
                
                XCTAssertEqual(edgeValue, root.layout.paddingEdge(edge)!, accuracy: 0.00001)
                
            }
        }
    }
    
    func testPaddingSideOverridesAll() {
        let edges: [Edge] = [.top, .bottom, .start, .end, .left, .right]
        
        for edge in 0..<2 {
            let edgeValue = Float(edge)
            for edge in edges {
                
                let root = FlexNode<NoFlexElement>()
                root.style.width = 100.0
                root.style.height = 100.0
                root.style.padding.all = 10.0
                root.style.padding[edge] = .point(edgeValue)
                
                root.calculateLayout(width: 100.0, height: 100.0, direction: .leftToRight)
                
                XCTAssertEqual(edgeValue, root.layout.paddingEdge(edge)!, accuracy: 0.00001)
                
            }
        }
    }
    
    func testPaddingHorizontalAndVerticalOverridesAll() {
        let directions: [Edge] = [.horizontal, .vertical]
        
        for edge in 0..<2 {
            let directionValue = Float(edge)
            for direction in directions {
                
                let root = FlexNode<NoFlexElement>()
                root.style.width = 100.0
                root.style.height = 100.0
                root.style.padding.all = 10.0
                root.style.padding[direction] = .point(directionValue)
                
                root.calculateLayout(width: 100.0, height: 100.0, direction: .leftToRight)
                
                if direction == .vertical {
                    XCTAssertEqual(directionValue, root.layout.padding.top, accuracy: 0.00001)
                    XCTAssertEqual(directionValue, root.layout.padding.bottom, accuracy: 0.00001)
                } else if direction == .horizontal {
                    XCTAssertEqual(directionValue, root.layout.padding.start, accuracy: 0.00001)
                    XCTAssertEqual(directionValue, root.layout.padding.end, accuracy: 0.00001)
                    XCTAssertEqual(directionValue, root.layout.padding.left(from: .leftToRight), accuracy: 0.00001)
                    XCTAssertEqual(directionValue, root.layout.padding.right(from: .leftToRight), accuracy: 0.00001)
                }
            }
        }
    }
}

