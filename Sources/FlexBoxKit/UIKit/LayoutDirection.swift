//
//  LayoutDirection.swift
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

extension Direction {
    var uiLayoutDirection: UIUserInterfaceLayoutDirection {
        switch self {
        case .inherit:
            return UIView.userInterfaceLayoutDirection(
                for: UISemanticContentAttribute.unspecified)
        case .leftToRight:
            return .leftToRight
        case .rightToLeft:
            return .rightToLeft
        }
    }
    
    init(_ layoutDirection: UIUserInterfaceLayoutDirection) {
        switch layoutDirection {
        case .leftToRight:
            self = .leftToRight
        case .rightToLeft:
            self = .rightToLeft
        @unknown default:
            self = .leftToRight
        }
    }
}

#endif
