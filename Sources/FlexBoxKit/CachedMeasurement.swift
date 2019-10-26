//
//  CachedMeasurement.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/4/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

internal class CachedMeasurement: Equatable, Codable {
    
    struct CacheData: Equatable, Codable {
        var availableWidth: Float?
        var availableHeight: Float?
        var widthMeasureMode: MeasureMode
        var heightMeasureMode: MeasureMode
        var computedWidth: Float
        var computedHeight: Float
    }
    
    private var _data: CacheData
    
    var availableWidth: Float? {
        get { return _data.availableWidth }
        set { _data.availableWidth = newValue }
    }
    
    var availableHeight: Float? {
        get { return _data.availableHeight }
        set { _data.availableHeight = newValue }
    }
    
    var widthMeasureMode: MeasureMode {
        get { return _data.widthMeasureMode }
        set { _data.widthMeasureMode = newValue }
    }
    
    var heightMeasureMode: MeasureMode {
        get { return _data.heightMeasureMode }
        set { _data.heightMeasureMode = newValue }
    }
    
    var computedWidth: Float {
        get { return _data.computedWidth }
        set { _data.computedWidth = newValue }
    }
    
    var computedHeight: Float
    {
        get { return _data.computedHeight }
        set { _data.computedHeight = newValue }
    }
    
    init(
        availableWidth: Float?,
        availableHeight: Float?,
        widthMeasureMode: MeasureMode,
        heightMeasureMode: MeasureMode,
        computedWidth: Float,
        computedHeight: Float)
    {
        _data = CacheData(
            availableWidth: availableWidth,
            availableHeight: availableHeight,
            widthMeasureMode: widthMeasureMode,
            heightMeasureMode: heightMeasureMode,
            computedWidth: computedWidth,
            computedHeight: computedHeight)
    }
    
    static func == (lhs: CachedMeasurement, rhs: CachedMeasurement) -> Bool {
        return lhs._data == rhs._data
    }
}
