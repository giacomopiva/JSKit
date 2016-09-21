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
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    // "abcde"[0...2] === "abc"
    // "abcde"[2..<4] === "cd"
    subscript (r: Range<Int>) -> String {
        return substring(with: characters.index(startIndex, offsetBy: r.lowerBound)..<characters.index(startIndex, offsetBy: r.upperBound))
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
        let str = self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return str
    }
    
   /**
    *  Format a string as a currency
    */
    func stringWithCurrencyFormat() -> String {
        let s = self.replacingOccurrences(of: ",", with: ".", options: [], range: nil)
        let parts = s.components(separatedBy: ".")
        var decimals = "00"
        if (parts.count >= 2) {
            decimals = "\( parts[1] )"
            decimals = (decimals.lenght() < 2) ? decimals + "0" : decimals
        }
        return "\(parts[0]).\(decimals)"
    }

   /**
    *  Format a string as a currency with currency symbol
    */
    func stringWithCurrencyFormat(_ currency:String, trailing:Bool = false) -> String {
        var s = self.stringWithCurrencyFormat()
        if trailing {
            s = s + currency
        } else {
            s = currency + s
        }
        return s
    }
    
    /**
     *  Calculate MD5 Hash of the String
     *  Note that the 
     *  #import <CommonCrypto/CommonCrypto.h>
     *  must be added to the Bridging-Header.h file to work 
     */
    /*func md5Hash() -> String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.dealloc(digestLen)
        return hash as String
    }*/
    
    /**
         Generates an NSAttributedString highligting words in the array
         
         - Parameter words: words to highlight with color
         - Parameter color: color to use for highlighted text
         - Parameter baseColor: color to use for non highlighted text
         - Parameter baseFont: color to use for text
         
         - Returns: NSAttributedString text
     */
    func highlightedTextWithWords(_ words: Array<String>, color: UIColor = UIColor.blue, baseColor: UIColor = UIColor.black, baseFont: UIFont = UIFont(name: "System", size: 12)!) -> NSAttributedString {
        let attributes = [NSFontAttributeName: baseFont, NSForegroundColorAttributeName: baseColor]
        let mutableString = NSMutableAttributedString(string: self, attributes: attributes)
        
        for word in words {
            if let range    = self.range(of: word) {
                let start   = self.characters.distance(from: self.startIndex, to: range.lowerBound)
                let end     = self.distance(from: range.lowerBound, to: range.upperBound)
                mutableString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(start, end))
            }
        }
        
        return mutableString
    }
}
