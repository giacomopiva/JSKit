//
//  JSUtils.swift
//  JSKit
//
//  Created by Giacomo Piva on 06/02/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

let kScreenWidth    = UIScreen.mainScreen().bounds.size.width
let kScreenHeight   = UIScreen.mainScreen().bounds.size.height

let kDayInSeconds = 86400 // 60 * 60 * 24

class JSUtils: NSObject {

   /**
    *  Get the name of the App
    */
    static func JSAppDisplayName() -> String {
        return UIDevice.currentDevice().name
    }
    
   /**
    *  Get the major version of the App
    */
    static func JSAppMajorVersion() -> String {
        if let info = NSBundle.mainBundle().infoDictionary {
            return info["CFBundleShortVersionString"] as! String
        }
        
        return ""
    }
    
   /**
    *  Get the minor version of the App
    */
    static func JSAppMinorVersion() -> String {
        if let info = NSBundle.mainBundle().infoDictionary {
            return info["CFBundleVersion"] as! String
        }
        
        return ""
    }

    /**
     *  Prints all the font installed in the system
     *  Usefull to find the name of installed fonts
     */
    static func JSFontInstalled() {
        for name in UIFont.familyNames() {
            print(name)
            print(UIFont.fontNamesForFamilyName(name))
        }
    }
}
