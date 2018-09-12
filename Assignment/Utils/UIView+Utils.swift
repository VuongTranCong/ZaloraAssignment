//
//  UIView+Utils.swift
//  Luna
//
//  Created by Admin Full on 10/5/16.
//  Copyright © 2016 Admin Full. All rights reserved.
//

import UIKit

extension UIView {
    
    func pin (item: UIView, attribute: NSLayoutConstraint.Attribute, constant: CGFloat = 0) {
        let contrainst = NSLayoutConstraint(item: item, attribute: attribute, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: attribute, multiplier: 1.0, constant: constant)
        contrainst.isActive = true
        self.addConstraint(contrainst)
    }
    
    func addFixHeightConstraint(height: CGFloat) {
        let heightConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: height)
        self.addConstraint(heightConstraint)
    }
    
    func addFixWidthConstraint(width: CGFloat) {
        let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: width)
        self.addConstraint(constraint)
    }
    
    func addWidthRatioConstraint() {
        let constraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.height, multiplier: 1, constant: 0)
        self.addConstraint(constraint)
    }
    
    func pinWithReturn (item: UIView, attribute: NSLayoutConstraint.Attribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        let contrainst = NSLayoutConstraint(item: item, attribute: attribute, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: attribute, multiplier: 1.0, constant: constant)
        self.addConstraint(contrainst)
        return contrainst
    }
    
    func pinFullSize (item: UIView) {
        item.translatesAutoresizingMaskIntoConstraints = false
        self.pin(item: item, attribute: NSLayoutConstraint.Attribute.leading, constant: 0)
        self.pin(item: item, attribute: NSLayoutConstraint.Attribute.trailing, constant: 0)
        self.pin(item: item, attribute: NSLayoutConstraint.Attribute.top, constant: 0)
        self.pin(item: item, attribute: NSLayoutConstraint.Attribute.bottom, constant: 0)
    }
    
    func setRandomBackgroundColor () {
        let hue = ( CGFloat(arc4random() % 256) / 256.0 )  //  0.0 to 1.0
        let saturation = ( CGFloat(arc4random() % 128) / 256.0 ) + 0.5  //  0.5 to 1.0, away from white
        let brightness = ( CGFloat(arc4random() % 128) / 256.0 ) + 0.5  //  0.5 to 1.0, away from black
        let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
        self.backgroundColor = color;
    }
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }
    
    func findWidthConstraint () -> NSLayoutConstraint! {
        for c in self.constraints {
            if c.firstItem as! NSObject == self && c.firstAttribute == NSLayoutConstraint.Attribute.width {
                return c
            }
        }
        return nil
    }
    
    func findHeightConstraint () -> NSLayoutConstraint! {
        for c in self.constraints {
            if c.firstItem as! NSObject == self && c.firstAttribute == NSLayoutConstraint.Attribute.height {
                return c
            }
        }
        return nil
    }
    
    func findBottomConstraint () -> NSLayoutConstraint! {
        guard self.superview != nil else {
            return nil
        }
        
        for c in (self.superview?.constraints)! {
            if c.secondItem != nil {
                if c.secondItem as! NSObject == self && c.firstAttribute == NSLayoutConstraint.Attribute.bottom {
                    return c
                }
            }
        }
        return nil
    }
    
    func showLoading(isShow: Bool, hideBackground: Bool = false) {
        if (isShow == true) {
            let loadingView = LoadingView()
            if hideBackground == true {
                loadingView.show(spinFrame: CGRect(x:0, y:self.frame.size.height / 2 - 40, width:80, height:0.0), parentView: self, color: kAppColor, backgroundColor: UIColor.clear)
            } else {
                loadingView.show(spinFrame: CGRect(x:0, y:self.frame.size.height / 2 - 40, width:80, height:0.0), parentView: self, color: kAppColor)
            }
        } else {
            for view in self.subviews {
                if view.isKind(of: LoadingView.classForCoder()) {
                    if let loadingView = view as? LoadingView {
                        loadingView.hide()
                    }
                }
            }
        }
    }
}
