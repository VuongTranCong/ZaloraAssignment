//
//  CornerButton.swift
//  LnLn Community
//
//  Created by Admin Full on 11/1/16.
//  Copyright © 2016 MTI. All rights reserved.
//

import UIKit

class CornerButton: UIButton {

    @IBInspectable var cornerRadius: Int = 0
    @IBInspectable var borderWidth: Int = 0
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var shrinkFont: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.borderColor = borderColor.cgColor
        
        if shrinkFont == true {
            self.titleLabel!.numberOfLines = 1
            self.titleLabel!.adjustsFontSizeToFitWidth = true
            self.titleLabel!.minimumScaleFactor = 0.01
            self.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if shrinkFont == true {
            self.titleLabel!.numberOfLines = 1
            self.titleLabel!.adjustsFontSizeToFitWidth = true
            self.titleLabel!.minimumScaleFactor = 0.01
            self.titleLabel!.lineBreakMode = NSLineBreakMode.byClipping
        }
    }

}
