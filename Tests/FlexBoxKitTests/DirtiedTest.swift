//
//  DirtiedTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class DirtiedTest: XCTestCase {
    
//    func testDirtied() {
//        let root = Node<NoFlexElement>()
//        root.name = "root"
//        root.style.alignItems = .flexStart
//        root.style.width = 100.0
//        root.style.height = 100.0
//
//        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
//
//        var dirtiedCount: Int = 0
//
//        root.dirtiedFunc = { node in
//            dirtiedCount += 1
//        }
//
//        XCTAssertEqual(0, dirtiedCount)
//
//        root.isDirty = true
//
//        XCTAssertEqual(1, dirtiedCount)
//
//        root.isDirty = true
//
//        XCTAssertEqual(1, dirtiedCount)
//
//    }
    
//    func testDirtiedPropagation() {
//        let root = Node<NoFlexElement>()
//        root.name = "root"
//        root.style.alignItems = .flexStart
//        root.style.width = 100.0
//        root.style.height = 100.0
//
//        let rootChild0 = Node<NoFlexElement>()
//        rootChild0.style.width = 50.0
//        rootChild0.style.height = 20.0
//
//        root.add(child: rootChild0)
//
//        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
//
//        var dirtiedCount: Int = 0
//
//        root.dirtiedFunc = { node in
//            dirtiedCount += 1
//        }
//
//        XCTAssertEqual(0, dirtiedCount)
//
//        root.markDirtyAndPropogate()
//
//        XCTAssertEqual(1, dirtiedCount)
//
//        root.markDirtyAndPropogate()
//
//        XCTAssertEqual(1, dirtiedCount)
//
//    }
    
//    func testDirtiedHierarchy() {
//        let root = Node<NoFlexElement>()
//        root.name = "root"
//        root.style.alignItems = .flexStart
//        root.style.width = 100.0
//        root.style.height = 100.0
//        
//        let rootChild0 = Node<NoFlexElement>()
//        rootChild0.style.width = 50.0
//        rootChild0.style.height = 20.0
//        
//        root.add(child: rootChild0)
//        
//        let rootChild1 = Node<NoFlexElement>()
//        rootChild0.style.width = 50.0
//        rootChild0.style.height = 20.0
//        
//        root.add(child: rootChild1)
//        
//        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
//        
//        var dirtiedCount: Int = 0
//        
//        rootChild0.dirtiedFunc = { node in
//            dirtiedCount += 1
//        }
//        
//        XCTAssertEqual(0, dirtiedCount)
//        
//        root.markDirtyAndPropogate()
//        
//        XCTAssertEqual(0, dirtiedCount)
//        
//        rootChild1.markDirtyAndPropogate()
//        
//        XCTAssertEqual(0, dirtiedCount)
//        
//        rootChild0.markDirtyAndPropogate()
//        
//        XCTAssertEqual(1, dirtiedCount)
//        
//    }
}
