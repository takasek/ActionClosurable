//
//  ActionClosurable.swift
//  ActionClosurable
//
//  Created by Yoshitaka Seki on 2016/04/11.
//  Copyright © 2016年 Yoshitaka Seki. All rights reserved.
//

import Foundation
import UIKit

public class Actor<T> {
    @objc func act(sender: AnyObject) { closure(sender as! T) }
    private let closure: T -> Void
    init(_ closure: T -> Void) {
        self.closure = closure
    }
}

private class GreenRoom {
    private var actors: [Any] = []
}
private var GreenRoomKey: UInt32 = 893
private func register<T>(closure: T -> Void, to object: AnyObject, @noescape configure: (Actor<T>, Selector) -> Void) {
    let actor = Actor(closure)

    let room = objc_getAssociatedObject(object, &GreenRoomKey) as? GreenRoom ?? {
        let room = GreenRoom()
        objc_setAssociatedObject(object, &GreenRoomKey, room, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return room
        }()
    room.actors.append(actor)

    configure(actor, #selector(Actor<T>.act(_:)))
}

public protocol ActionClosurable {}
extension ActionClosurable where Self: AnyObject {
    func registerClosure<T>(closure: T -> Void, @noescape configure: (Actor<T>, Selector) -> Void) {
        register(closure, to: self, configure: configure)
    }
}

extension NSObject: ActionClosurable {}
