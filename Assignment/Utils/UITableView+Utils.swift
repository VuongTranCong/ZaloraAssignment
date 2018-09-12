//
//  UITableView+Utils.swift
//  SexHealth
//
//  Created by VuongTC on 5/25/17.
//  Copyright © 2017 Intima. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCell(className: String) {
        let nib = UINib(nibName: className, bundle: nil)
        self.register(nib, forCellReuseIdentifier: className)
    }
}
