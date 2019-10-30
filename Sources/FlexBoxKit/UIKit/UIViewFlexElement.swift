//
//  UIViewFlexElement.swift
//  DeclarativeUIKit
//
//  Created by Timothy Kautz on 6/2/19.
//  Copyright © 2019 Takkido. All rights reserved.
//
#if os(Linux)
#elseif os(macOS)
#else
import Foundation
import UIKit

internal struct UIViewFlexElement: FlexElement {
    
    static var `default`: UIViewFlexElement {
        return .init()
    }
    
    var isIncludedInLayout: Bool = true
    var isFlexLayoutEnabled: Bool = false
    var isBaseView: Bool = false
    
    weak var view: UIView?
    
    init() {
        
    }
}

#endif
