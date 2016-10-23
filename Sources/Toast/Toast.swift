//
//  Toast.swift
//  Toast
//
//  Created by toshi0383 on 2016/10/23.
//
//

import Foundation
#if os(OSX)
import AppKit
#elseif os(iOS) || os(tvOS)
import UIKit
#endif

enum Position {
    case center
}

public class Style {
    public static var shared = Style()
    init() {
        self.font = Font.systemFont(ofSize: fontSize)
    }
    #if os(iOS)
    public var fontSize: CGFloat = 16
    public var font: Font
    public var horizontalMargin: CGFloat = 5
    public var verticalMargin: CGFloat = 5
    public var cornerRadius: CGFloat = 6
    #elseif os(tvOS)
    public var fontSize: CGFloat = 42
    public var font: Font
    public var horizontalMargin: CGFloat = 15
    public var verticalMargin: CGFloat = 10
    public var cornerRadius: CGFloat = 6
    #elseif os(OSX)
    public var fontSize: CGFloat = 16
    public var font: Font
    public var horizontalMargin: CGFloat = 10
    public var verticalMargin: CGFloat = 5
    public var cornerRadius: CGFloat = 6
    #endif
    public var backgroundColor: Color = .black
    public var foregroundColor: Color = .white
    public var fadeoutDuration: CGFloat = 0.25
    public var fadeoutDelay: CGFloat = 1.0
    var labelOriginWithMargin: CGPoint {
        return CGPoint(x: horizontalMargin, y: verticalMargin)
    }
}

class ToastView: View {
    private let message: String
    private let labelSize: CGSize
    private let style: Style
    init(message: String) {
        self.message = message
        self.style = Style.shared
        self.labelSize = message.size(with: style.fontSize)
        let size = CGSize(
            width: labelSize.width + style.horizontalMargin*2,
            height: labelSize.height + style.verticalMargin*2
        )
        let rect = CGRect(origin: .zero, size: size)
        super.init(frame: rect)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }

    #if os(iOS) || os(tvOS)
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
            configure()
        }
    }
    #elseif os(OSX)
    override func viewDidMoveToSuperview() {
        super.viewDidMoveToSuperview()
        wantsLayer = true
        if superview != nil {
            configure()
        }
    }
    #endif
    
    private func configure() {
        frame = superview!.bounds

        let rect = CGRect(origin: style.labelOriginWithMargin, size: labelSize)
        let sizeWithMargin = CGSize(
            width: rect.width + style.horizontalMargin*2,
            height: rect.height + style.verticalMargin*2
        )
        let rectWithMargin = CGRect(
            origin: .zero, // position is manipulated later anyways
            size: sizeWithMargin
        )
        // outside Container
        let container = CALayer()
        container.frame = rectWithMargin
        container.position = CGRect.center(of: superview!)
        container.backgroundColor = style.backgroundColor.cgColor
        container.cornerRadius = style.cornerRadius
        _layer.addSublayer(container)
        // inside TextLayer
        let text = CATextLayer()
        text.frame = rect
        text.position = CGRect.center(of: container)
        text.string = message
        text.font = Font.systemFont(ofSize: style.fontSize)
        text.fontSize = style.fontSize
        text.alignmentMode = "center"
        text.foregroundColor = style.foregroundColor.cgColor
        text.backgroundColor = style.backgroundColor.cgColor
        text.contentsScale = _layer.contentsScale // For Retina Display
        container.addSublayer(text)
    }
}

extension View {
    public func makeToast(_ message: String) {
        let toast = ToastView(message: message)
        self.addSubview(toast)
        hideAnimation(view: toast, style: Style.shared)
    }
}
