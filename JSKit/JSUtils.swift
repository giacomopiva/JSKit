//
//  JSUtils.swift
//  JSKit
//
//  Created by Giacomo Piva on 06/02/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

let kScreenWidth    = UIScreen.main.bounds.size.width
let kScreenHeight   = UIScreen.main.bounds.size.height

let kDayInSeconds = 86400 // 60 * 60 * 24

class JSUtils: NSObject {

   /**
        Returns the name of the App
    */
    static func JSAppDisplayName() -> String {
        return UIDevice.current.name
    }
    
   /**
        Returns the major version of the App
    */
    static func JSAppMajorVersion() -> String {
        if let info = Bundle.main.infoDictionary {
            return info["CFBundleShortVersionString"] as! String
        }
        
        return ""
    }
    
   /**
        Returns the minor version of the App
    */
    static func JSAppMinorVersion() -> String {
        if let info = Bundle.main.infoDictionary {
            return info["CFBundleVersion"] as! String
        }
        
        return ""
    }

    /**
        Returns all the font installed in the system
        Usefull to find the name of installed fonts
     */
    static func JSFontInstalled() {
        for name in UIFont.familyNames {
            print(name)
            print(UIFont.fontNames(forFamilyName: name))
        }
    }
    
    /**
        Returns the Device model name
     */
    static func JSDeviceModelName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let id = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return id
    }
    
    /**
        Returns the Device os version
     */
    static func JSDeviceSystemVersion() -> String {
        return UIDevice.current.systemVersion
    }
}
