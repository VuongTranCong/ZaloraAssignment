//
//  LoadingView.swift
//  LnLn Community
//
//  Created by Admin Full on 10/13/16.
//  Copyright © 2016 MTI. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    var spinnerView: UIView!
    var isShowed: Bool!
    public private(set) var animating: Bool = false
    var loadingColor: UIColor!
    var backgroundLoadingColor: UIColor = UIColor(white: 0.1, alpha: 0.3)
    
    func show(size: CGSize, parentView: UIView, color: UIColor, backgroundColor: UIColor = UIColor(white: 0.1, alpha: 0.3)) {
        let spinFrame = CGRect(x: self.frame.size.width / 2 - size.width / 2, y: self.frame.size.height / 2 - size.height / 2, width: size.width, height: size.height)
        self.show(spinFrame: spinFrame, parentView: parentView, color: color, backgroundColor: backgroundColor)
    }
    
    func show(spinFrame: CGRect, parentView: UIView, color: UIColor, backgroundColor: UIColor = UIColor(white: 0.5, alpha: 0.5)) {
        self.frame = parentView.bounds
        parentView.addSubview(self)
        parentView.pinFullSize(item: self)
        self.backgroundColor = backgroundColor
        loadingColor = color
        
        let x = self.frame.size.width / 2 - spinFrame.size.width / 2
        let height = spinFrame.size.width
        let newFrame = CGRect(x: x, y: spinFrame.origin.y, width: spinFrame.size.width, height: height)
        if spinnerView == nil {
            spinnerView = UIView(frame: newFrame)
            self.addSubview(self.spinnerView)
            self.setUp()
        } else {
            spinnerView.frame = newFrame
        }
        spinnerView.backgroundColor = UIColor.clear
        
        self.stopActivity(animated: true)
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.startAnimating()
            }
//            DispatchQueue.global(qos: .default).async {
//                self.startAnimating()
//            }
        }
        pinViewToParentView(parentView: parentView)
    }
    
    func pinViewToParentView (parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.pin(item: self, attribute: .top)
        parentView.pin(item: self, attribute: .bottom)
        parentView.pin(item: self, attribute: .left)
        parentView.pin(item: self, attribute: .right)
        
        
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: spinnerView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        self.addConstraint(horizontalConstraint)
        let verticalConstraint = NSLayoutConstraint(item: spinnerView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        self.addConstraint(verticalConstraint)
        let widthConstraint = NSLayoutConstraint(item: spinnerView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: spinnerView.frame.size.width)
        self.addConstraint(widthConstraint)
        let heightConstraint = NSLayoutConstraint(item: spinnerView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: spinnerView.frame.size.height)
        self.addConstraint(heightConstraint)
    }
    
    public func startAnimating() {
        self.isHidden = false
        self.animating = true
        self.layer.speed = 1
    }
    
    func stopActivity(animated: Bool) {
    }
    
    func setUp() {
        self.spinnerView.layer.shouldRasterize = true
        setUpAnimation(in: self.layer, size: spinnerView.frame.size, color: loadingColor)
    }
    
    func hide() {
        self.isShowed = false
        self.removeFromSuperview()
    }
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let duration: CFTimeInterval = 1
        let beginTime = CACurrentMediaTime()
        let beginTimes = [0, 0.2, 0.4]
        
        // Scale animation
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        
        scaleAnimation.duration = duration
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.duration = duration
        opacityAnimation.keyTimes = [0, 0.05, 1]
        opacityAnimation.values = [0, 1, 0]
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw balls
        for i in 0 ..< 3 {
            let circle: CAShapeLayer = CAShapeLayer()
            let path: UIBezierPath = UIBezierPath(roundedRect: spinnerView.bounds, cornerRadius: size.width / 2)
            circle.fillColor = color.cgColor
            
            let frame = CGRect(x: 0,
                               y: 0,
                               width: size.width,
                               height: size.height)

            circle.backgroundColor = nil
            circle.path = path.cgPath
            circle.frame = frame
            
            
            animation.beginTime = beginTime + beginTimes[i]
            circle.opacity = 0
            circle.add(animation, forKey: "animation")
            spinnerView.layer.addSublayer(circle)
        }
    }
}
