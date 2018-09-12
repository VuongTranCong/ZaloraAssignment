//
//  NSObject+Utils.swift
//  SexHealth
//
//  Created by VuongTC on 5/16/17.
//  Copyright © 2017 Intima. All rights reserved.
//

import UIKit
import Foundation

extension NSObject {
    class var className: String {
        let result = String(describing: self)
        return result
    }
    
    subscript(key: String) -> Any? {
        let m = Mirror(reflecting: self)
        for child in m.children {
            if child.label == key { return child.value }
        }
        return nil
    }
}
