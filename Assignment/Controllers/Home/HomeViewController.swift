//
//  HomeViewController.swift
//  Assignment
//
//  Created by VuongTC on 9/11/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet var tweetTextView: UITextView!
    @IBOutlet var tweetButton: UIButton!
    var placeholderLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetButton.isEnabled = !(StringUtils.isEmpty(string: tweetTextView.text))
        configurePlaceHolderLabel()
        tweetTextView.becomeFirstResponder()
    }
    
    func configurePlaceHolderLabel() {
        placeholderLabel = UILabel()
        placeholderLabel.text = "Enter some text..."
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (tweetTextView.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        tweetTextView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (tweetTextView.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !tweetTextView.text.isEmpty
    }
    
    @IBAction func tweetTapped(_ sender: Any) {
        self.showLoading(isShow: true)
        MessageSplitting.split(message: tweetTextView.text, size: 50) { (messages, error) in
            if (StringUtils.isEmpty(string: error) == true) {
                let view = ResultViewController(ownNibName: true)
                view.messages = messages
                self.navigationController?.pushViewController(view, animated: true)
            } else {
                self.alertMessage(message: error ?? "")
            }
            self.showLoading(isShow: false)
        }
    }
}

extension HomeViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        tweetButton.isEnabled = !(StringUtils.isEmpty(string: tweetTextView.text))
        placeholderLabel.isHidden = !(StringUtils.isEmpty(string: tweetTextView.text))
    }
}
