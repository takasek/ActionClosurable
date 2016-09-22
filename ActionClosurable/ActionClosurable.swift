//
//  ActionClosurable.swift
//  ActionClosurable
//
//  Created by Yoshitaka Seki on 2016/04/11.
//  Copyright © 2016年 Yoshitaka Seki. All rights reserved.
//

import Foundation

public class Actor<T> {
    @objc func act(_ sender: AnyObject) { closure(sender as! T) }
    fileprivate let closure: (T) -> Void
    init(acts closure: @escaping (T) -> Void) {
        self.closure = closure
    }
}

private class GreenRoom {
    fileprivate var actors: [Any] = []
}
private var GreenRoomKey: UInt32 = 893

private func _register<T>(_ actor: Actor<T>, to object: AnyObject) {
    let room = objc_getAssociatedObject(object, &GreenRoomKey) as? GreenRoom ?? {
        let room = GreenRoom()
        objc_setAssociatedObject(object, &GreenRoomKey, room, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return room
        }()
    room.actors.append(actor)
}

public protocol ActionClosurable {}
public extension ActionClosurable where Self: AnyObject {
    public func register(closure: @escaping (Self) -> Void, configure: (Actor<Self>, Selector) -> Void) {
        let actor = Actor(acts: closure)
        configure(actor, #selector(Actor<AnyObject>.act(_:)))
        _register(actor, to: self)
    }
    public static func register(closure: @escaping (Self) -> Void, configure: (Actor<Self>, Selector) -> Self) -> Self {
        let actor = Actor(acts: closure)
        let instance = configure(actor, #selector(Actor<AnyObject>.act(_:)))
        _register(actor, to: instance)
        return instance
    }
}

extension NSObject: ActionClosurable {}
