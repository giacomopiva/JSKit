//
//  UIColor+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 12/01/15.
//

import UIKit

extension UIColor {

   /**
    * Get a UIColor from an HEX string
    * It works with # and without as well.
    * With 3 or 6 chars (#fff or #ffffff)
    */
    static func colorWithHexString(hexString:String) -> UIColor {
        var str:String = hexString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet)
        var rgb:UInt32 = 0
        str = str.uppercaseString
        if (str.hasPrefix("#")) {
            str = str.substringFromIndex(str.startIndex.advancedBy(1))
        }
        if (str.characters.count != 6) {
            if str.characters.count == 3 {
                str = "".stringByAppendingString("\(str[0])")
                        .stringByAppendingString("\(str[0])")
                        .stringByAppendingString("\(str[1])")
                        .stringByAppendingString("\(str[1])")
                        .stringByAppendingString("\(str[2])")
                        .stringByAppendingString("\(str[2])")
            } else {
                return UIColor.grayColor()
            }
        }
        NSScanner(string: str).scanHexInt(&rgb)
        return UIColor(
            red:    CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green:  CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue:   CGFloat(rgb & 0x0000FF) / 255.0,
            alpha:  CGFloat(1.0)
        )
    }
}
