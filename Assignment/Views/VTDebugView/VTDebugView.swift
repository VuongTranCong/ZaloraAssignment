//
//  VTDebugView.swift
//  CreditBird
//
//  Created by VuongTC on 1/13/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class VTDebugView: UIView {
    static let shared: VTDebugView = VTDebugView()
    var mainLabel: UILabel!
    var content: String = ""
    var timer: Timer?
    
    func configure() {
        let window = UIApplication.shared.keyWindow!
        window.addSubview(self)
        self.layer.zPosition = .greatestFiniteMagnitude
        
        var frame = window.bounds
        let viewHeight = CGFloat(100)
        frame.origin = CGPoint(x: 10, y: frame.size.height - viewHeight - 10)
        frame.size = CGSize(width: frame.size.width - 20, height: viewHeight)
        self.frame = frame
        
//        self.translatesAutoresizingMaskIntoConstraints = false
//        window.pin(item: self, attribute: NSLayoutAttribute.leading, constant: 10)
//        window.pin(item: self, attribute: NSLayoutAttribute.trailing, constant: 100)
//        window.pin(item: self, attribute: NSLayoutAttribute.bottom, constant: 10)
//        window.pin(item: self, attribute: NSLayoutAttribute.top, constant: 10)
//        self.addFixHeightConstraint(height: 200)
        
        self.isUserInteractionEnabled = false
        self.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        
        //Main label
        mainLabel = UILabel()
        self.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.font = UIFont.systemFont(ofSize: 9)
//        self.pin(item: mainLabel, attribute: .leading, constant: 10)
//        self.pin(item: mainLabel, attribute: .trailing, constant: 10)
//        self.pin(item: mainLabel, attribute: .bottom, constant: 10)
        self.pinFullSize(item: mainLabel)
        mainLabel.numberOfLines = 0
//        mainLabel.backgroundColor = UIColor.red
//        mainLabel.text = "ac"        
   }
}
