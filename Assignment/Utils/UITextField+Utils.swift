//
//  UITextField+Utils.swift
//  Talaha
//
//  Created by Nicholas on 11/23/16.
//  Copyright © 2016 Home. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    func setupLeftImage(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 18 + 50, height: 18)
        imageView.contentMode = .scaleAspectFit
        self.leftView = imageView
        self.leftViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 18 + 50, height: 18))
        self.rightView = view
        self.rightViewMode = .always
    }
    
    func setupRightImage(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 18 + 50, height: 18)
        imageView.contentMode = .scaleAspectFit
        self.rightView = imageView
        self.rightViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: 55))
        self.leftView = view
        self.leftViewMode = .always
    }

}
