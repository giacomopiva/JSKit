//
//  String+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 12/01/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

extension String {
        
    // "abcde"[0] === 'a'
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    // "abcde"[0...2] === "abc"
    // "abcde"[2..<4] === "cd"
    subscript (r: Range<Int>) -> String {
        return substringWithRange(startIndex.advancedBy(r.startIndex)..<startIndex.advancedBy(r.endIndex))
    }

    /**
     *  Returns the lenght of a String
     */
    func lenght() -> Int {
        return self.characters.count
    }
   
   /**
    *  Remove HTML tags froma a String
    */
    func stringByStrippingHTML() -> String {
        let str = self.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
        return str
    }
    
   /**
    *  Format a string as a currency
    */
    func stringWithCurrencyFormat() -> String {
        let s = self.stringByReplacingOccurrencesOfString(",", withString: ".", options: [], range: nil)
        let parts = s.componentsSeparatedByString(".")
        var decimals = "00"
        if (parts.count >= 2) {
            decimals = "\( parts[1] )"
            decimals = (decimals.lenght() < 2) ? decimals.stringByAppendingString("0") : decimals
        }
        return "\(parts[0]).\(decimals)"
    }

   /**
    *  Format a string as a currency with currency symbol
    */
    func stringWithCurrencyFormat(currency:String, trailing:Bool = false) -> String {
        var s = self.stringWithCurrencyFormat()
        if trailing {
            s = s.stringByAppendingString(currency)
        } else {
            s = currency.stringByAppendingString(s)
        }
        return s
    }
}
