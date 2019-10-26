//
//  DirtyMarkingTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/21/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif
import XCTest
@testable import FlexBoxKit

class DirtyMarkingTest: XCTestCase {
    func testDirtyPropagation() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 20.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        rootChild0.style.width = 20.0
        
        XCTAssertTrue(root.isDirty)
        XCTAssertTrue(rootChild0.isDirty)
        XCTAssertFalse(rootChild1.isDirty)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertFalse(root.isDirty)
        XCTAssertFalse(rootChild0.isDirty)
        XCTAssertFalse(rootChild1.isDirty)
        
    }
    
    func testDirtyPropagationOnlyIfPropChanged() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignItems = .flexStart
        root.style.width = 100.0
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 20.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.width = 50.0
        rootChild1.style.height = 20.0
        root.add(child: rootChild1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        rootChild0.style.width = 50.0
        
        XCTAssertFalse(root.isDirty)
        XCTAssertFalse(rootChild0.isDirty)
        XCTAssertFalse(rootChild1.isDirty)
        
    }
    
    func testDirtyMarkAllChildrenAsDirtyWhenDisplayChanges() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.flexDirection = .row
        root.style.height = 100.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.flexGrow = 1.0
        root.add(child: rootChild0)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        rootChild1.name = "rootChild1"
        rootChild1.style.flexGrow = 1.0
        root.add(child: rootChild1)
        
        let rootChild1Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0.name = "rootChild1Child0"
        rootChild1.add(child: rootChild1Child0)
        
        let rootChild1Child0Child0 = FlexNode<NoFlexElement>()
        rootChild1Child0Child0.name = "rootChild1Child0Child0"
        rootChild1Child0Child0.style.width = 8.0
        rootChild1Child0Child0.style.height = 16.0
        rootChild1Child0.add(child: rootChild1Child0Child0)
        
        rootChild0.style.display = .flex
        rootChild1.style.display = .none
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        XCTAssertEqual(0.0, rootChild1Child0Child0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0Child0.layout.height, accuracy: 0.00001)
        
        rootChild0.style.display = .none
        rootChild1.style.display = .flex
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        XCTAssertEqual(8.0, rootChild1Child0Child0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(16.0, rootChild1Child0Child0.layout.height, accuracy: 0.00001)
        
        rootChild0.style.display = .flex
        rootChild1.style.display = .none
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        XCTAssertEqual(0.0, rootChild1Child0Child0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild1Child0Child0.layout.height, accuracy: 0.00001)
        
        rootChild0.style.display = .none
        rootChild1.style.display = .flex
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        XCTAssertEqual(8.0, rootChild1Child0Child0.layout.width, accuracy: 0.00001)
        XCTAssertEqual(16.0, rootChild1Child0Child0.layout.height, accuracy: 0.00001)
        
    }
    
    func testDirtyNodeOnlyIfChildrenAreActuallyRemoved() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignItems = .flexStart
        root.style.width = 50.0
        root.style.height = 50.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        rootChild0.name = "rootChild0"
        rootChild0.style.width = 50.0
        rootChild0.style.height = 50.0
        root.add(child: rootChild0)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        let rootChild1 = FlexNode<NoFlexElement>()
        root.remove(child: rootChild1)
        
        XCTAssertFalse(root.isDirty)
        
        root.remove(child: rootChild0)
        XCTAssertTrue(root.isDirty)
        
    }
    
    func testDirtyNodeOnlyIfUndefinedValuesGetsSetToUndefined() {
        let root = FlexNode<NoFlexElement>()
        root.name = "root"
        root.style.alignItems = .flexStart
        root.style.width = 50.0
        root.style.height = 50.0
        root.style.min.width = .undefined
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertFalse(root.isDirty)
        
        root.style.min.width = .undefined
        
        XCTAssertFalse(root.isDirty)
        
    }
}
