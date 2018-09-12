//
//  VTTextView.swift
//  SexHealth
//
//  Created by VuongTC on 7/1/17.
//  Copyright © 2017 Intima. All rights reserved.
//

import UIKit

class VTTextView: UITextView {
    @IBInspectable var showDone: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView(){
        if showDone {
            initDoneButtonOnKeyboard()
            self.inputAccessoryView = doneToolbar
        }
    }
    
    var doneToolbar: UIToolbar!
    func initDoneButtonOnKeyboard() {
        doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let line = UIView(frame: CGRect(x: 0, y: 43, width: 1000, height: 0.5))
        line.backgroundColor = UIColor.lightGray
        doneToolbar.addSubview(line)
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: NSLocalizedString("Done", comment: ""), style: UIBarButtonItem.Style.done, target: self, action: #selector(VTTextView.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
    }
    
    @objc func doneButtonAction() {
        _ = self.resignFirstResponder()
    }
}
