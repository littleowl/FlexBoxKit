//
//  UIView.swift
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
import ObjectiveC

fileprivate var flexNodeAssociation = AssociatedObject<FlexNode<UIViewFlexElement>>()

public enum FlexibileDimension {
    case flexibleWidth
    case flexibleHeight
}

public enum FlexBoxUIKitIntegration {
    private static var sizeThatFitClasses: [UIView.Type] = [UIView.self]
    
    public static func addSizeThatFitsClassExceptions(
        classes: [UIView.Type]
    ) {
        sizeThatFitClasses.append(contentsOf: classes)
    }
    
    public static func isSizeThatFitException<ViewType: UIView>(
        for viewClass: ViewType.Type
    ) -> Bool {
        guard
            sizeThatFitClasses.contains(where: { $0 == viewClass })
            else { return false }
        return true
    }
}

extension UIView {
    internal var flexNode: FlexNode<UIViewFlexElement> {
        guard
            let flexNodeBox = flexNodeAssociation[self],
            let flexNode = flexNodeBox.value
            else {
                let flexNode = FlexNode<UIViewFlexElement>()
                if
                    self.isMember(of: UIView.self) ||
                        FlexBoxUIKitIntegration.isSizeThatFitException(
                            for: type(of: self))
                {
                    flexNode.element.isBaseView = true
                }
                
                flexNode.element.view = self
                let flexNodeBox = BoxedAssociation(value: flexNode)
                flexNodeAssociation[self] = flexNodeBox
                return flexNode
        }
        return flexNode
    }
    
    public var flex: FlexBox {
        get { return flexNode.style }
        set { flexNode.style = newValue }
    }
    
    public var isIncludedInLayout: Bool {
        get { return flexNode.element.isIncludedInLayout }
        set { flexNode.element.isIncludedInLayout = newValue }
    }
    
    public var isFlexLayoutEnabled: Bool {
        get { return flexNode.element.isFlexLayoutEnabled }
        set { flexNode.element.isFlexLayoutEnabled = newValue }
    }

    public var isLeaf: Bool {
        assert(Thread.isMainThread, "This must be called on the main thread.")
        guard self.isFlexLayoutEnabled else { return true }
        for subview in subviews {
            if
                subview.isFlexLayoutEnabled,
                subview.isIncludedInLayout
            {
                return false
            }
        }
        return true
    }
    
    private var isBaseView: Bool {
        return flexNode.element.isBaseView
    }
    
    public var resolvedDirection: Direction {
        return flexNode.layout.direction
    }
    
    public func applyLayout(
        preservingOrigin: Bool = false,
        flexibileDimension: FlexibileDimension? = nil
        ) {
        var width: Float? = Float(bounds.size.width)
        var height: Float? = Float(bounds.size.height)
        if let flexible = flexibileDimension {
            switch flexible {
            case .flexibleWidth:
                width = nil
            case .flexibleHeight:
                height = nil
            }
        }
        calculateLayout(width: width, height: height)
        applyLayoutToViewHierarchy(preserveOrigin: preservingOrigin)
    }
    
    @discardableResult
    public func calculateIntrinsicSize() -> CGSize {
        return calculateLayout(
            width: nil,
            height: nil)
    }
    
    @discardableResult
    public func calculateLayout(
        with size: CGSize
        ) -> CGSize {
        return calculateLayout(
            width: Float(size.width),
            height: Float(size.height))
    }
    
    @discardableResult
    public func calculateLayout(
        width w: Float?,
        height h: Float?
        ) -> CGSize {
        attachNodes()
        let direction = UIView.userInterfaceLayoutDirection(
            for: self.semanticContentAttribute)
        let context = ProcessingContext()
        context[.default] = MeasureHolder(closure: UIView.measureView)
        context[.text] = MeasureHolder(closure: UIView.measureView)
        flexNode.calculateLayout(
            width: w,
            height: h,
            direction: Direction(direction),
            processingContext: ProcessingContext())
        let width = flexNode.layout.dimensions.width
        let height = flexNode.layout.dimensions.height
        return .init(width: CGFloat(width), height: CGFloat(height))
    }
    
    public var layoutFrame: CGRect {
        let left = flexNode.layout.position.left
        let top = flexNode.layout.position.top
        let width = flexNode.layout.dimensions.width
        let height = flexNode.layout.dimensions.height
        
        return .init(
            origin: .init(
                x: CGFloat(left),
                y: CGFloat(top)),
            size: .init(
                width: CGFloat(width),
                height: CGFloat(height)))
    }
}

extension UIView {
    private func attachNodes() {
        guard !isLeaf else {
            flexNode.removeAllChildren()
            //            flexNode.us
            return
        }
        let subviewsToInclude = subviews.filter({
            $0.isFlexLayoutEnabled && $0.isIncludedInLayout
        })
        
        if !flexNode.hasSameChildren(as: subviewsToInclude) {
            flexNode.removeAllChildren()
            subviewsToInclude.forEach({
                flexNode.add(child: $0.flexNode)
            })
        }
        subviewsToInclude.forEach({
            $0.attachNodes()
        })
    }
    
    private func applyLayoutToViewHierarchy(preserveOrigin: Bool = false) {
        assert(Thread.isMainThread, "Must be called on the main thread")
        guard isIncludedInLayout else { return }
        
        let left = flexNode.layout.position.left
        let top = flexNode.layout.position.top
        let width = flexNode.layout.dimensions.width
        let height = flexNode.layout.dimensions.height
        
        let frame = CGRect(
            origin: .init(
                x: CGFloat(left).roundedToPixel,
                y: CGFloat(top).roundedToPixel),
            size: .init(
                width: CGFloat(width).roundedToPixel,
                height: CGFloat(height).roundedToPixel))
        self.frame = frame
        
        guard !isLeaf else { return }
        subviews.forEach({ $0.applyLayoutToViewHierarchy(preserveOrigin: false) })
    }
    
}

extension CGFloat {
    static let screenScale: CGFloat = UIScreen.main.scale
    
    public var roundedToPixel: CGFloat {
        return (self * CGFloat.screenScale).rounded() / CGFloat.screenScale
    }
}

extension FlexNode {
    fileprivate func hasSameChildren(as subViews: [UIView]) -> Bool {
        guard
            self.children.count == subViews.count
            else { return false }
        for pair in zip(children, subViews) {
            if pair.0 !== pair.1 {
                return false
            }
        }
        return true
    }
}

extension UIView {

    fileprivate static func SanitizeMeasurement(
        constrainedValue: CGFloat,
        measuredValue: CGFloat,
        measureMode: MeasureMode
        ) -> CGFloat {
        let result: CGFloat
        switch measureMode {
        case .undefined:
            result = measuredValue
        case .exactly:
            result = constrainedValue
        case .atMost:
            result = min(constrainedValue, measuredValue)
        }
        return result
    }
    
    fileprivate static func measureView(
        measureTask: MeasureTask
        ) -> Size {
        guard
            let node = measureTask.node as? FlexNode<UIViewFlexElement>,
            let view = node.element.view
            else { return .zero }
        
        let constrainedWidth: CGFloat
        if case .undefined = measureTask.widthMode {
            constrainedWidth = .greatestFiniteMagnitude
        } else {
            if let width = measureTask.width {
                constrainedWidth = CGFloat(width)
            } else {
                constrainedWidth = .greatestFiniteMagnitude
            }
        }
        
        let constrainedHeight: CGFloat
        if case .undefined = measureTask.heightMode {
            constrainedHeight = .greatestFiniteMagnitude
        } else {
            if let height = measureTask.height {
                constrainedHeight = CGFloat(height)
            } else {
                constrainedHeight = .greatestFiniteMagnitude
            }
        }
        
        var sizeThatFits: CGSize = .zero
        
        // The default implementation of sizeThatFits: returns the existing size of
        // the view. That means that if we want to layout an empty UIView, which
        // already has got a frame set, its measured size should be CGSizeZero, but
        // UIKit returns the existing size.
        //
        // See https://github.com/facebook/yoga/issues/606 for more information.
        
        if !view.isBaseView || view.subviews.count > 0 {
            sizeThatFits = view.sizeThatFits(.init(
                width: constrainedWidth,
                height: constrainedHeight))
        }
        
        return .init(
            width: Float(SanitizeMeasurement(
                constrainedValue: constrainedWidth,
                measuredValue: sizeThatFits.width,
                measureMode: measureTask.widthMode)),
            height: Float(SanitizeMeasurement(
                constrainedValue: constrainedHeight,
                measuredValue: sizeThatFits.height,
                measureMode: measureTask.heightMode)))
    }
}

fileprivate struct AssociatedObject<Value> {
    
    typealias Policy = objc_AssociationPolicy
    var key: NSString
    let policy: Policy
    
    init(policy: Policy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        self.key = String(reflecting: Value.self) as NSString
        self.policy = policy
    }
    
    func get(key: UnsafeRawPointer, from object: AnyObject) -> BoxedAssociation<Value>? {
        guard
            let value = objc_getAssociatedObject(object, key) as? BoxedAssociation<Value>
            else { return nil }
        return value
    }
    
    private func set(
        key: UnsafeRawPointer,
        with boxedValue: BoxedAssociation<Value>?,
        from object: AnyObject)
    {
        objc_setAssociatedObject(object, key, nil, policy)
        if boxedValue?.value != nil {
            objc_setAssociatedObject(object, key, boxedValue, policy)
        }
    }
    
    subscript(object: AnyObject) -> BoxedAssociation<Value>? {
        mutating get {
            return get(key: &key, from: object)
        }
        set {
            set(key: &key, with: newValue, from: object)
        }
    }
}

fileprivate class BoxedAssociation<Value> {
    public var value: Value?
    public init(value: Value?) {
        self.value = value
    }
}

#endif
