//
//  CornerView.swift
//  Companion
//
//  Created by VuongTC on 9/8/15.
//  Copyright (c) 2015 Home. All rights reserved.
//

import UIKit

class CornerView: UIView {

    @IBInspectable var cornerRadius: Int = 0
    @IBInspectable var borderWidth: Int = 0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    
    @IBInspectable var shadow: Bool = false
    @IBInspectable var shadowWidth: CGFloat = 0
    @IBInspectable var shadowOpacity: Float = 0
    @IBInspectable var sizeWidth: CGFloat = 0
    @IBInspectable var sizeHeight: CGFloat = 0
    @IBInspectable var useInset: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reloadView()
    }
    
    func reloadView () {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
        
        if shadow == true {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: sizeWidth, height: sizeHeight)
            self.layer.shadowRadius = shadowWidth
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if useInset {
            let shadowRect: CGRect = self.bounds.insetBy(dx: 0.0, dy: -1.0);  // inset top/bottom
            self.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        }
    }
    
}
