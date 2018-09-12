//
//  UIViewController+Utils.swift
//  SexHealth
//
//  Created by VuongTC on 4/26/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit
import MediaPlayer

extension UIViewController {
    func pushOrPresentViewController(_ view: UIViewController, animated: Bool) {
        if let navController = self as? UINavigationController {
            navController.pushViewController(view, animated: animated)
        } else {
            if let navController = self.navigationController {
                navController.pushViewController(view, animated: animated)
            } else {
                self.present(view, animated: animated, completion: nil)
            }
        }
    }
    
    class func topViewPushOrPresent(_ view: UIViewController, animated: Bool) {
        if let topView = topViewController() {
            topView.pushOrPresentViewController(view, animated: animated)
        }
    }
    
    class func topViewPresent(_ view: UIViewController, animated: Bool) {
        if let topView = topViewController() {
            topView.present(view, animated: true, completion: nil)
        }
    }
}

extension UIAlertController {
    class func showAlert(with error: Error, on viewController: UIViewController) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel)
        alertController.addAction(dismissAction)
        viewController.present(alertController, animated: true)
    }
}
