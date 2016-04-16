//
//  ActionClosurable.swift
//  ActionClosurable
//
//  Created by Yoshitaka Seki on 2016/04/11.
//  Copyright © 2016年 Yoshitaka Seki. All rights reserved.
//

import Foundation

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
private func register<T>(actor: Actor<T>, to object: AnyObject) {
    let room = objc_getAssociatedObject(object, &GreenRoomKey) as? GreenRoom ?? {
        let room = GreenRoom()
        objc_setAssociatedObject(object, &GreenRoomKey, room, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return room
        }()
    room.actors.append(actor)
}

public protocol ActionClosurable {}
extension ActionClosurable where Self: AnyObject {
    func registerClosure<T>(closure: T -> Void, @noescape configure: (Actor<T>, Selector) -> Void) {
        let actor = Actor(closure)
        register(actor, to: self)
        configure(actor, #selector(Actor<T>.act(_:)))
    }
}

extension NSObject: ActionClosurable {}
