//
//  Extensions.swift
//  ActionClosurable
//
//  Created by Yoshitaka Seki on 2016/04/11.
//  Copyright © 2016年 Yoshitaka Seki. All rights reserved.
//

import UIKit

extension ActionClosurable where Self: UIControl {
    public func on(controlEvents: UIControlEvents, closure: Self -> Void) {
        registerClosure(closure) {
            self.addTarget($0, action: $1, forControlEvents: controlEvents)
        }
    }
}

extension ActionClosurable where Self: UIButton {
    public func onTap(closure: Self -> Void) {
        registerClosure(closure) {
            self.addTarget($0, action: $1, forControlEvents: .TouchUpInside)
        }
    }
}


extension ActionClosurable where Self: UIGestureRecognizer {
    public func onGesture(closure: Self -> Void) {
        registerClosure(closure) {
            self.addTarget($0, action: $1)
        }
    }
}

extension ActionClosurable where Self: UIBarButtonItem {
    public init(image: UIImage?, style: UIBarButtonItemStyle, closure: Self -> Void) {
        self.init()
        self.image = image
        self.style = style
        self.onTap(closure)
    }
    public func onTap(closure: Self -> Void) {
        registerClosure(closure) {
            self.target = $0
            self.action = $1
        }
    }
}

extension ActionClosurable where Self: NSTimer {
    public static func timerWithTimeInterval(ti: NSTimeInterval, userInfo: AnyObject?, repeats yesOrNo: Bool, closure: Self -> Void) -> Self {
        let actor = Actor(closure)
        let timer = Self.init(timeInterval: ti, target: actor, selector: #selector(actor.act(_:)), userInfo: userInfo, repeats: yesOrNo)
        register(actor, to: timer)
        return timer
    }
    public static func scheduledTimerWithTimeInterval(ti: NSTimeInterval, userInfo: AnyObject?, repeats yesOrNo: Bool, closure: Self -> Void) -> Self {
        let timer = timerWithTimeInterval(ti, userInfo: userInfo, repeats: yesOrNo, closure: closure)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
        return timer
    }
}

