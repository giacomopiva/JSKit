//
//  UIColor+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 12/01/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

extension UIColor {

   /**
    * Get a UIColor from an HEX string
    * It works with # and without as well.
    * With 3 or 6 chars (#fff or #ffffff)
    */
    static func colorWithHexString(_ hexString:String) -> UIColor {
        var str:String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines as CharacterSet)
        var rgb:UInt32 = 0
        str = str.uppercased()
        if (str.hasPrefix("#")) {
            str = str.substring(from: str.characters.index(str.startIndex, offsetBy: 1))
        }
        if (str.characters.count != 6) {
            if str.characters.count == 3 {
                str = ((((("" + "\(str[0])") + "\(str[0])") + "\(str[1])") + "\(str[1])") + "\(str[2])") + "\(str[2])"
            } else {
                return UIColor.gray
            }
        }
        Scanner(string: str).scanHexInt32(&rgb)
        return UIColor(
            red:    CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green:  CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue:   CGFloat(rgb & 0x0000FF) / 255.0,
            alpha:  CGFloat(1.0)
        )
    }
}
