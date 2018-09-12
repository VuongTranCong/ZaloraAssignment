//
//  NumberUtils.swift
//  Talaha
//
//  Created by VuongTC on 1/14/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class NumberUtils {
    static let formatterWithSepator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        formatter.numberStyle = NumberFormatter.Style.decimal
        return formatter
    }()
    
    static func nilOrZero(number: Int?) -> Bool {
        if number == nil {
            return true
        }
        if number == 0 {
            return true
        }
        return false
    }
    
    static func toMoney (value: Double?) -> String {
        if value == nil {
            return ""
        }
        
        if let moneyString = NumberUtils.formatterWithSepator.string(from: NSNumber(value: Int(value!))) {
            return "\(moneyString) vnd"
        }
        return ""
    }
    
    static func doubleFromDecimal(decimal: Decimal) -> Double {
        let doubleFromDecimal = NSDecimalNumber(decimal: decimal).doubleValue
        return doubleFromDecimal
    }
}
