//
//  Extensions.swift
//  ActionClosurable
//
//  Created by Yoshitaka Seki on 2016/04/11.
//  Copyright © 2016年 Yoshitaka Seki. All rights reserved.
//

import UIKit

extension UIControl {
    public func on(controlEvents: UIControlEvents, closure: UIControl -> Void) {
        registerClosure(closure) {
            self.addTarget($0, action: $1, forControlEvents: controlEvents)
        }
    }
}

extension UIButton {
    public func onTap(closure: UIButton -> Void) {
        registerClosure(closure) {
            self.addTarget($0, action: $1, forControlEvents: .TouchUpInside)
        }
    }
}

extension UITapGestureRecognizer {
    public func onGesture(closure: UITapGestureRecognizer -> Void) {
        registerClosure(closure) {
            self.addTarget($0, action: $1)
        }
    }
}

extension UIBarButtonItem {
    public convenience init(image: UIImage?, style: UIBarButtonItemStyle, closure: UIBarButtonItem -> Void) {
        self.init()
        self.image = image
        self.style = style
        self.onTap(closure)
    }
    public func onTap(closure: UIBarButtonItem -> Void) {
        registerClosure(closure) {
            self.target = $0
            self.action = $1
        }
    }
}