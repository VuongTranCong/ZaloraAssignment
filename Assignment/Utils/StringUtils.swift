//
//  StringUtils.swift
//  TRE
//
//  Created by ThuNguyen on 7/22/16.
//  Copyright © 2016 S3. All rights reserved.
//

import UIKit

class StringUtils{
    static func isEmpty(string: String?) -> Bool {
        if string == nil {
            return true
        }
        if string?.isEmptyOrWhitespace() == true {
            return true
        }
        if string?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
            return true
        }
        return false
    }
    
    static func isNumeric(string: String?) -> Bool
    {
        if string == nil {
            return false
        }
        if string?.isEmptyOrWhitespace() == true {
            return false
        }
        let number = Int(string!)
        return number != nil
    }
    
    static func JSONStringify(value: [String: AnyObject]!) -> String {
        guard value != nil else {
            return ""
        }
        let options = JSONSerialization.WritingOptions.prettyPrinted
        do {
            let data = try JSONSerialization.data(withJSONObject: value, options: options)
            if let string = String(data: data, encoding: .utf8) {
                return string
            }
        } catch let error {
            print("Error \(error)")
        }
        return ""
    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPhone() -> Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
    
    func isEmptyOrWhitespace() -> Bool {
        if(self.isEmpty) {
            return true
        }
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
    }
    
    func wrapDefaultHtml (width: CGFloat) -> String {
        let imgWidth = width
        return "<html><style>body {color: #545454;font-size: 14px; font-family: 'Lato-Regular'; width: \(width)px;margin-left: 0px;margin-right: 0px;}img {width: \(imgWidth)px;margin:0px 0px 0px 0px;}</style><body>\(self)</body></html>"
    }
    
    func toDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func words() -> [String] {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        let words = components.filter { !$0.isEmpty }
        return words
    }
    
    func currencyInputFormatting() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.groupingSeparator = ","
        formatter.currencySymbol = ""
        formatter.minimumFractionDigits = 0
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double))

        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
    
    func getHtmlString(completion:@escaping ((_ attributeString: NSMutableAttributedString?) -> Void)) {
        if StringUtils.isEmpty(string: self) {
            completion(nil)
            return
        }
        DispatchQueue.main.async {
            var htmlString = String(self)
            htmlString = htmlString.replacingOccurrences(of: "\n", with: "br")
            do {
                let attrString = try NSMutableAttributedString(data: htmlString.data(using: String.Encoding.unicode)!, options: [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
                
                if let font = UIFont(name: kFontOpenSansRegular, size: 15) {
                    attrString.addAttributes([NSAttributedString.Key.font : font], range: NSRange(location: 0, length: attrString.length))
                }
                completion(attrString)
            } catch {
                completion(nil)
            }
        }
    }
}
