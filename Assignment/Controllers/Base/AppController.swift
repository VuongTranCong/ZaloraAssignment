//
//  AppController.swift
//  Luna
//
//  Created by Admin Full on 10/6/16.
//  Copyright © 2016 Admin Full. All rights reserved.
//

import UIKit

let developMode = false
let mapUserUid = ""

class AppController: NSObject {
    static let shared = AppController()
    var dataDefaults = UserDefaults.standard
    
    override init() {
        super.init()
    }
}
