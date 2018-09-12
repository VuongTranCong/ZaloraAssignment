//
//  BaseViewController.swift
//  Luna
//
//  Created by Admin Full on 10/11/16.
//  Copyright © 2016 Admin Full. All rights reserved.
//

import UIKit

enum BottomBarStatus {
    case hideBar
    case showBar
    case dontCare
}

class BaseViewController: UIViewController {
    var loadingView: LoadingView!
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    var shouldDisplayLeftMenu = false
    var bottomBarStatus = BottomBarStatus.showBar
    @IBOutlet weak var keyboardScrollView: UIScrollView!
    @IBInspectable var registerKeyboardNotification: Bool = false

    init(ownNibName: Bool) {
        let nibName = String(describing: type(of: self))
        super.init(nibName: nibName, bundle: nil)
    }
    
    func addDesignImage() {
        let designName = String(describing: type(of: self))
        let image = UIImageView(image: UIImage(named: designName))
        image.isUserInteractionEnabled = false
        image.alpha = 0.5
        image.contentMode = UIView.ContentMode.top
        self.view.addSubview(image)
        self.view.pinFullSize(item: image)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        if registerKeyboardNotification == true {
            addKeyboardObserver()
        }
    }
    
    deinit {
        if registerKeyboardNotification {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if kTestMatchDesign {
            addDesignImage()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    @IBAction func backTapped(_ sender: AnyObject!) {
        self.closeView()
    }
    
    func backToKindOfView(coder: AnyClass) {
        for view in (self.navigationController?.viewControllers)! {
            if view.isKind(of: coder) {
                self.navigationController?.popToViewController(view, animated: true)
                break
            }
        }
    }
    
    func closeView(completion: (()->Void)! = nil) {
        if let navigation = self.navigationController {
            navigation.popViewController(animated: true)
            completion?()
        } else {
            self.dismiss(animated: true, completion: { () -> Void in
                completion?()
            })
        }
    }
    
    func showLoading (isShow: Bool, color: UIColor = kAppColor) {
        if (loadingView == nil) {
            loadingView = LoadingView()
        }
        
        if (isShow == true) {
            let parentView = mainContentView != nil ? mainContentView : self.view
            loadingView.show(spinFrame: CGRect(x:0, y:(parentView?.frame.size.height)! / 2 - 40, width:80, height:0.0), parentView: parentView!, color: color)
        } else {
            loadingView.hide()
        }
    }
    
    func alertMessage (message: String, handler: (() -> Void)! = nil) {
        DispatchQueue.main.async {
            var title: String! = kErrorTitle
            var errorMessage = message
            
            let parseComponent = message.components(separatedBy: "|")
            if parseComponent.count > 1 {
                title = parseComponent[0]
                errorMessage = parseComponent[1]
            }
            
            let alertController = UIAlertController(title: title, message:
                errorMessage, preferredStyle: UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { (_) in
                handler?()
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func alertMessageTitle (message: String, title: String, handler: (() -> Void)! = nil) {
        DispatchQueue.main.async {
            var title: String! = title
            var errorMessage = message
            
            let parseComponent = message.components(separatedBy: "|")
            if parseComponent.count > 1 {
                title = parseComponent[0]
                errorMessage = parseComponent[1]
            }
            
            let alertController = UIAlertController(title: title, message:
                errorMessage, preferredStyle: UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { (_) in
                handler?()
            }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func showLoadingTopView(isShow: Bool) {
        if let topView = topViewController() as? BaseViewController {
            topView.showLoading(isShow: isShow)
        }
    }
}

extension BaseViewController {
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.animateWithKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.animateWithKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func animateWithKeyboard(notification: NSNotification) {
        guard keyboardScrollView != nil else {
            return
        }
        
        let userInfo       = notification.userInfo!
        let moveUp         = (notification.name == UIResponder.keyboardWillShowNotification)
        let keyboardFrame  = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue //Can not use UIKeyboardFrameBeginUserInfoKey
        var contentInset : UIEdgeInsets!
        let offsetBottom: CGFloat = 0
        
        if moveUp {
            contentInset = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: (keyboardFrame?.size.height)! - offsetBottom, right: 0.0)
        } else {
            contentInset = UIEdgeInsets.zero
        }
        keyboardScrollView.contentInset = contentInset
    }
}

extension BaseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
