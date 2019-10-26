//
//  ProcessingContext.swift
//  FlexBoxKit
//
//  Created by Timothy Kautz on 12/24/18.
//  Copyright © 2018 Takkido. All rights reserved.
//

import Foundation

public protocol MeasuringHelper {
    func measure(task: MeasureTask) -> Size
}

public protocol BaselineHelper {
    func baseline(task: BaselineTask) -> Float
}

public protocol DirtiedHelper {
    func measure(node: AnyFlexNode) -> Size
}

public struct MeasureHolder: MeasuringHelper {
    public var closure: MeasureFunc
    public func measure(task: MeasureTask) -> Size {
        return closure(task)
    }
    
    public init(closure: @escaping MeasureFunc) {
        self.closure = closure
    }
}

struct BaselineHolder: BaselineHelper {
    var closure: BaselineFunc
    func baseline(task: BaselineTask) -> Float {
        return closure(task)
    }
}

open class ProcessingContext {
    final internal var gDepth: Int = 0
    final internal var gCurrentGenerationCount: Int = 0
    final internal var gPrintChanges: Bool = false
    final internal var gPrintSkips: Bool = false
    
    final private var measuringTable: [FlexNodeType: MeasuringHelper] = [:]
    final private var baselineTable: [FlexNodeType: BaselineHelper] = [:]
    final private var dirtiedTable: [FlexNodeType: DirtiedHelper] = [:]
    
    final public subscript(nodeType: FlexNodeType) -> MeasuringHelper? {
        get { return measuringTable[nodeType] }
        set { measuringTable[nodeType] = newValue }
    }
    
    final public subscript(nodeType: FlexNodeType) -> BaselineHelper? {
        get { return baselineTable[nodeType] }
        set { baselineTable[nodeType] = newValue }
    }
    
    final public subscript(nodeType: FlexNodeType) -> DirtiedHelper? {
        get { return dirtiedTable[nodeType] }
        set { dirtiedTable[nodeType] = newValue }
    }
    
    public required init() {}
    
    final internal func reset() {
        gDepth = 0
        gCurrentGenerationCount = 0
        gPrintChanges = false
        gPrintSkips = false
    }
}


