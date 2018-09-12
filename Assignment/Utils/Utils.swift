//
//  Utils.swift
//  VideoQuickStart
//
//  Copyright © 2016-2017 Twilio, Inc. All rights reserved.
//

import Foundation
import UIKit

func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let nav = base as? UINavigationController {
        return topViewController(base: nav.visibleViewController)
    }
    if let tab = base as? UITabBarController {
        if let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
    }
    if let presented = base?.presentedViewController {
        return topViewController(base: presented)
    }
    return base
}

func alertSimpleMessage(message: String, handler: (() -> Void)! = nil) {
    guard let topView = topViewController() else {
        return
    }
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
    
    if topView.presentedViewController == nil {
        topView.present(alertController, animated: true) {
        }
    } else {
        print("fail")
    }
}

func alertOKCancelMessage(message: String, okHandler: (() -> Void)! = nil, cancelHandler: (() -> Void)! = nil) {
    guard let topView = topViewController() else {
        return
    }
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
        okHandler?()
    }))
    alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: { (_) in
        cancelHandler?()
    }))
    topView.present(alertController, animated: true, completion: nil)
}

// Helper to determine if we're running on simulator or device
struct PlatformUtils {
    static let isSimulator: Bool = {
        var isSim = false
        #if arch(i386) || arch(x86_64)
            isSim = true
        #endif
        return isSim
    }()
    
    static func callNumber(phoneNumber:String?) -> String? {
        guard StringUtils.isEmpty(string: phoneNumber) == false else {
            return NSLocalizedString("Phone number is not available.", comment: "")
        }
        if let phoneCallURL = URL(string: "tel://\(phoneNumber!)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            } else {
                return NSLocalizedString("Device does not support this function", comment: "")
            }
        }
        return nil
    }
}

struct TokenUtils {
    static func fetchToken(url : String) throws -> String {
        var token: String = "TWILIO_ACCESS_TOKEN"
        let requestURL: URL = URL(string: url)!
        do {
            let data = try Data(contentsOf: requestURL)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:AnyObject]
                token = json["token"] as! String
            } catch let error as NSError{
                print ("Error with json, error = \(error)")
                throw error
            }
        } catch let error as NSError {
            print ("Invalid token url, error = \(error)")
            throw error
        }
        return token
    }
}

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

struct CheckUtils {
    static func stringFromObject(object:Any?) -> String
    {
        if (object as? NSNull) != nil
        {
            return ""
        }
        else if (object as? String) != nil
        {
            return object as! String
        }
        else if (object as? NSNumber) != nil
        {
            return (object as! NSNumber).description
        }
        return ""
    }

    static func isNull(someObject: AnyObject?) -> Bool
    {
        guard let someObject = someObject else {
            return true
        }
        
        return (someObject is NSNull)
    }
    
    static func timeLeftSinceDate(dateT:Date ) -> String {
        let today10am = Date()
        
        var seconds = Int(today10am.timeIntervalSince(dateT))
        
        var month = Int((floor(Double(seconds / (3600 * 24 * 7 * 4)))))
        if (month != 0)
        {
            seconds -= month * 3600 * 24 * 7 * 4
        }
        
        var week = Int((floor(Double(seconds / (3600 * 24 * 7)))))
        if(week != 0)
        {
            seconds -= week * 3600 * 24 * 7;
        }
        
        var days = Int(floor(Double(seconds / (3600 * 24))));
        if(days != 0)
        {
            seconds -= days * 3600 * 24;
        }
        
        var hours = Int(floor(Double(seconds / 3600)));
        if(hours != 0)
        {
            seconds -= hours * 3600;
        }
        
        var minutes = Int(floor(Double(seconds / 60)));
        if(minutes != 0 )
        {
            seconds -= minutes * 60;
        }
        
        if(month != 0)
        {
            if (month < 0)
            {
                month = month * -1;
            }
           return "\(month) \(NSLocalizedString("months", comment: ""))"
        }
        
        else if(week != 0) {
        if (week < 0)
        {
            week = week * -1;
        }
            return "\(week) \(NSLocalizedString("weeks", comment: ""))"
        }
        
        else if(days != 0)
        {
            if (days < 0)
            {
                days = days * -1;
            }
            return "\(days) \(NSLocalizedString("days", comment: ""))"
        }
        
        else if(hours != 0) {
            if (hours < 0)
            {
                hours = hours * -1;
            }
            return "\(hours) \(NSLocalizedString("hours", comment: ""))"
        }
        
        else if(minutes != 0)
        {
            if (minutes < 0)
            {
                minutes = minutes * -1;
            }
            return "\(minutes) \(NSLocalizedString("minutes", comment: ""))"
        }
        
        else if(seconds != 0)
        {
            if (seconds < 0)
            {
                seconds = seconds * -1;
            }
            return "\(seconds) \(NSLocalizedString("seconds", comment: ""))"
        }
        else{
        return "1 \(NSLocalizedString("seconds", comment: ""))"
        }
    }

}



// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
