//
//  Extensions.swift
//  ActionClosurable
//
//  Created by Yoshitaka Seki on 2016/04/11.
//  Copyright © 2016年 Yoshitaka Seki. All rights reserved.
//

import UIKit

extension ActionClosurable where Self: UIControl {
    public func on(_ controlEvents: UIControlEvents, closure: @escaping (Self) -> Void) {
        register(closure: closure) {
            self.addTarget($0, action: $1, for: controlEvents)
        }
    }
}

extension ActionClosurable where Self: UIButton {
    public func onTap(_ closure: @escaping (Self) -> Void) {
        register(closure: closure) {
            self.addTarget($0, action: $1, for: .touchUpInside)
        }
    }
}


extension ActionClosurable where Self: UIGestureRecognizer {
    public func onGesture(_ closure: @escaping (Self) -> Void) {
        register(closure: closure) {
            self.addTarget($0, action: $1)
        }
    }
    public init(closure: @escaping (Self) -> Void) {
        self.init()
        onGesture(closure)
    }
}

extension ActionClosurable where Self: UIBarButtonItem {
    public init(title: String, style: UIBarButtonItemStyle, closure: @escaping (Self) -> Void) {
        self.init()
        self.title = title
        self.style = style
        self.onTap(closure)
    }
    public init(image: UIImage?, style: UIBarButtonItemStyle, closure: @escaping (Self) -> Void) {
        self.init()
        self.image = image
        self.style = style
        self.onTap(closure)
    }
    public func onTap(_ closure: @escaping (Self) -> Void) {
        register(closure: closure) {
            self.target = $0
            self.action = $1
        }
    }
}

