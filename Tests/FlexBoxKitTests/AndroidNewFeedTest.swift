//
//  AndroidNewFeedTest.swift
//  FlexBoxKitTests
//
//  Created by Timothy Kautz on 12/20/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import XCTest
@testable import FlexBoxKit

class AndroidNewFeedTest: XCTestCase {
    
    func testAndroidNewsFeed() {

        let root = FlexNode<NoFlexElement>()
        root.style.alignContent = .stretch
        root.style.width = 1080.0
        
        let rootChild0 = FlexNode<NoFlexElement>()
        root.add(child: rootChild0)
        
        let rootChild0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0.style.alignContent = .stretch
        rootChild0.add(child: rootChild0Child0)
        
        let rootChild0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0.style.alignContent = .stretch
        rootChild0Child0.add(child: rootChild0Child0Child0)
        
        let rootChild0Child0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0Child0.style.flexDirection = .row
        rootChild0Child0Child0Child0.style.alignContent = .stretch
        rootChild0Child0Child0Child0.style.alignItems = .flexStart
        rootChild0Child0Child0Child0.style.margin.start = 36.0
        rootChild0Child0Child0Child0.style.margin.top = 24.0
        rootChild0Child0Child0.add(child: rootChild0Child0Child0Child0)
        
        let rootChild0Child0Child0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0Child0Child0.style.flexDirection = .row
        rootChild0Child0Child0Child0Child0.style.alignContent = .stretch
        rootChild0Child0Child0Child0.add(child: rootChild0Child0Child0Child0Child0)
        
        let rootChild0Child0Child0Child0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0Child0Child0Child0.style.alignContent = .stretch
        rootChild0Child0Child0Child0Child0Child0.style.width = 120.0
        rootChild0Child0Child0Child0Child0Child0.style.height = 120.0
        rootChild0Child0Child0Child0Child0.add(child: rootChild0Child0Child0Child0Child0Child0)
        
        let rootChild0Child0Child0Child0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0Child0Child1.style.alignContent = .stretch
        rootChild0Child0Child0Child0Child1.style.flexShrink = 1.0
        rootChild0Child0Child0Child0Child1.style.margin.right = 36.0
        rootChild0Child0Child0Child0Child1.style.padding.left = 36.0
        rootChild0Child0Child0Child0Child1.style.padding.top = 21.0
        rootChild0Child0Child0Child0Child1.style.padding.right = 36.0
        rootChild0Child0Child0Child0Child1.style.padding.bottom = 18.0
        rootChild0Child0Child0Child0.add(child: rootChild0Child0Child0Child0Child1)
        
        let rootChild0Child0Child0Child0Child1Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0Child0Child1Child0.style.flexDirection = .row
        rootChild0Child0Child0Child0Child1Child0.style.alignContent = .stretch
        rootChild0Child0Child0Child0Child1Child0.style.flexShrink = 1.0
        rootChild0Child0Child0Child0Child1.add(child: rootChild0Child0Child0Child0Child1Child0)
        
        let rootChild0Child0Child0Child0Child1Child1 = FlexNode<NoFlexElement>()
        rootChild0Child0Child0Child0Child1Child1.style.alignContent = .stretch
        rootChild0Child0Child0Child0Child1Child1.style.flexShrink = 1.0
        rootChild0Child0Child0Child0Child1.add(child: rootChild0Child0Child0Child0Child1Child1)
        
        let rootChild0Child0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child0Child1.style.alignContent = .stretch
        rootChild0Child0.add(child: rootChild0Child0Child1)
        
        let rootChild0Child0Child1Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child1Child0.style.flexDirection = .row
        rootChild0Child0Child1Child0.style.alignContent = .stretch
        rootChild0Child0Child1Child0.style.alignItems = .flexStart
        rootChild0Child0Child1Child0.style.margin.start = 174.0
        rootChild0Child0Child1Child0.style.margin.top = 24.0
        rootChild0Child0Child1.add(child: rootChild0Child0Child1Child0)
        
        let rootChild0Child0Child1Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child1Child0Child0.style.flexDirection = .row
        rootChild0Child0Child1Child0Child0.style.alignContent = .stretch
        rootChild0Child0Child1Child0.add(child: rootChild0Child0Child1Child0Child0)
        
        let rootChild0Child0Child1Child0Child0Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child1Child0Child0Child0.style.alignContent = .stretch
        rootChild0Child0Child1Child0Child0Child0.style.width = 72.0
        rootChild0Child0Child1Child0Child0Child0.style.height = 72.0
        rootChild0Child0Child1Child0Child0.add(child: rootChild0Child0Child1Child0Child0Child0)
        
        let rootChild0Child0Child1Child0Child1 = FlexNode<NoFlexElement>()
        rootChild0Child0Child1Child0Child1.style.alignContent = .stretch
        rootChild0Child0Child1Child0Child1.style.flexShrink = 1.0
        rootChild0Child0Child1Child0Child1.style.margin.right = 36.0
        rootChild0Child0Child1Child0Child1.style.padding.left = 36.0
        rootChild0Child0Child1Child0Child1.style.padding.top = 21.0
        rootChild0Child0Child1Child0Child1.style.padding.right = 36.0
        rootChild0Child0Child1Child0Child1.style.padding.bottom = 18.0
        rootChild0Child0Child1Child0.add(child: rootChild0Child0Child1Child0Child1)
        
        let rootChild0Child0Child1Child0Child1Child0 = FlexNode<NoFlexElement>()
        rootChild0Child0Child1Child0Child1Child0.style.flexDirection = .row
        rootChild0Child0Child1Child0Child1Child0.style.alignContent = .stretch
        rootChild0Child0Child1Child0Child1Child0.style.flexShrink = 1.0
        rootChild0Child0Child1Child0Child1.add(child: rootChild0Child0Child1Child0Child1Child0)
        
        let rootChild0Child0Child1Child0Child1Child1 = FlexNode<NoFlexElement>()
        rootChild0Child0Child1Child0Child1Child1.style.alignContent = .stretch
        rootChild0Child0Child1Child0Child1Child1.style.flexShrink = 1.0
        rootChild0Child0Child1Child0Child1.add(child: rootChild0Child0Child1Child0Child1Child1)
        
        root.calculateLayout(width: nil, height: nil, direction: .leftToRight)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(240.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(240.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(240.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(144.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0Child0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild0Child0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1044.0, rootChild0Child0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child0Child0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(39.0, rootChild0Child0Child0Child0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0Child0Child0Child0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(21.0, rootChild0Child0Child0Child0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0Child0Child0Child0Child1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(21.0, rootChild0Child0Child0Child0Child1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(144.0, rootChild0Child0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0Child0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(96.0, rootChild0Child0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(174.0, rootChild0Child0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild0Child0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(906.0, rootChild0Child0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(39.0, rootChild0Child0Child1Child0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0Child0Child1Child0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(21.0, rootChild0Child0Child1Child0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0Child0Child1Child0Child1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(21.0, rootChild0Child0Child1Child0Child1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        root.calculateLayout(width: nil, height: nil, direction: .rightToLeft)
        
        XCTAssertEqual(0.0, root.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, root.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, root.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(240.0, root.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(240.0, rootChild0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(240.0, rootChild0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(144.0, rootChild0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild0Child0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1044.0, rootChild0Child0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(924.0, rootChild0Child0Child0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(120.0, rootChild0Child0Child0Child0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(816.0, rootChild0Child0Child0Child0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child0Child0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(39.0, rootChild0Child0Child0Child0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0Child0Child0Child0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(21.0, rootChild0Child0Child0Child0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0Child0Child0Child0Child1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(21.0, rootChild0Child0Child0Child0Child1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child0Child0Child1Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(144.0, rootChild0Child0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(1080.0, rootChild0Child0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(96.0, rootChild0Child0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(24.0, rootChild0Child0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(906.0, rootChild0Child0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(834.0, rootChild0Child0Child1Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child0Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child0Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child0Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child0Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(726.0, rootChild0Child0Child1Child0Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(72.0, rootChild0Child0Child1Child0Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(39.0, rootChild0Child0Child1Child0Child1.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0Child0Child1Child0Child1Child0.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(21.0, rootChild0Child0Child1Child0Child1Child0.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1Child0.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1Child0.layout.dimensions.height, accuracy: 0.00001)
        
        XCTAssertEqual(36.0, rootChild0Child0Child1Child0Child1Child1.layout.position.left, accuracy: 0.00001)
        XCTAssertEqual(21.0, rootChild0Child0Child1Child0Child1Child1.layout.position.top, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1Child1.layout.dimensions.width, accuracy: 0.00001)
        XCTAssertEqual(0.0, rootChild0Child0Child1Child0Child1Child1.layout.dimensions.height, accuracy: 0.00001)
        
    }
}
