//
//  SharedFunctionality.swift
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

fileprivate class HideAnimationDelegate: NSObject, CAAnimationDelegate {
    private weak var view: View?
    fileprivate init(view: View) {
        self.view = view
    }

    fileprivate static func delegate(forView view: View) -> CAAnimationDelegate {
        return HideAnimationDelegate(view: view)
    }

    fileprivate func animationDidStart(_ anim: CAAnimation) {
        view?._layer.opacity = 0.0
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        view?.removeFromSuperview()
        view = nil
    }
}

fileprivate class ShowAnimationDelegate: NSObject, CAAnimationDelegate {
    private weak var view: View?
    fileprivate init(view: View) {
        self.view = view
    }

    fileprivate static func delegate(forView view: View) -> CAAnimationDelegate {
        return ShowAnimationDelegate(view: view)
    }

    fileprivate func animationDidStart(_ anim: CAAnimation) {
        view?._layer.opacity = 1.0
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    }
}

func showAnimation(view: View, style: Style) {
    let anim = CABasicAnimation(keyPath: "opacity")
    let timing = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    anim.timingFunction = timing
    let currentLayerTime = view._layer.convertTime(CACurrentMediaTime(), from: nil)
    anim.beginTime = currentLayerTime + CFTimeInterval(style.fadeInOutDelay)
    anim.duration = CFTimeInterval(style.fadeInOutDuration)
    anim.fromValue = 0.0
    anim.toValue = 1.0
    anim.isRemovedOnCompletion = false
    anim.delegate = ShowAnimationDelegate.delegate(forView: view)

    view._layer.add(anim, forKey: "show animation")
}

func hideAnimation(view: View, style: Style) {
    let anim = CABasicAnimation(keyPath: "opacity")
    let timing = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    anim.timingFunction = timing
    let currentLayerTime = view._layer.convertTime(CACurrentMediaTime(), from: nil)
    anim.beginTime = currentLayerTime + CFTimeInterval(style.fadeInOutDelay)
    anim.duration = CFTimeInterval(style.fadeInOutDuration)
    anim.fromValue = 1.0
    anim.toValue = 0.0
    anim.isRemovedOnCompletion = false
    anim.delegate = HideAnimationDelegate.delegate(forView: view)

    view._layer.add(anim, forKey: "hide animation")
}
