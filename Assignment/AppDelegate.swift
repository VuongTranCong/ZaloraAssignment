//
//  AppDelegate.swift
//  Assignment
//
//  Created by VuongTC on 9/11/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initFirstViewController()
        
        let message = "I          I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages          "
//        let message = "I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. This is the started of message number 9. This is the started of message number 9. This is the started of message 11 I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. This is the started of message number 9. This is the started of message number 9. This is the started of message 11 I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. This is the started of message number 9. This is the started of message number 9. This is the started of message 11 I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. This is the started of message number 9. This is the started of message number 9. This is the started of message 11 I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. I can`t believe Tweeter now supports chunking my messages, so I don't have to do it myself. This is the started of message number 9. This is the started of message number 9. This is the started of message 11"
        MessageSplitting.split(message: message, size: 50) { (messages, error) in
            if (StringUtils.isEmpty(string: error) == false) {
                print("Error: \(error ?? "")")
            }
            for mess in messages {
                print("length: \(mess.count)\nmess: \(mess)")
                if (mess.count > 50) {
                    print("wrong code")
                }
            }
        }
        
        return true
    }
    
    func initFirstViewController () {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let initViewController = HomeViewController(ownNibName: true)
        let navigationController = UINavigationController(rootViewController: initViewController)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        if developMode == true {
            VTDebugView.shared.configure()
        }
    }

}

