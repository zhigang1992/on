//
//  On.swift
//  on
//
//  Created by Kyle Fang on 3/20/16.
//  Copyright © 2016 Kyle Fang. All rights reserved.
//

import UIKit
import ObjectiveC

public protocol Onable {
    
}

class DummyTarget: NSObject {
    let action:UIControlEvents -> Void
    init(action:UIControlEvents -> Void) {
        self.action = action
    }
    func execute(event:UIControlEvents) {
        self.action(event)
    }
}

private var callbackStoreKey:UInt8 = 0

extension UIControl {
    var callbacks:[UInt: DummyTarget] {
        get {
            return objc_getAssociatedObject(self, &callbackStoreKey) as? [UInt: DummyTarget] ?? [:]
        }
        set {
            objc_setAssociatedObject(self, &callbackStoreKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UIControl : Onable {}

extension Onable where Self : UIControl {
    func on(event:UIControlEvents, action:(Self, UIControlEvents) -> Void) {
        let dummyTarget = DummyTarget(action: {
            action(self, $0)
        })
        self.addTarget(dummyTarget, action: #selector(DummyTarget.execute(_:)), forControlEvents: event)
        self.callbacks[event.rawValue] = dummyTarget
    }
    func off(event:UIControlEvents) {
        guard let dummyTarget = self.callbacks[event.rawValue] else { return }
        self.removeTarget(dummyTarget, action: #selector(DummyTarget.execute(_:)), forControlEvents: event)
        self.callbacks[event.rawValue] = nil
    }
}