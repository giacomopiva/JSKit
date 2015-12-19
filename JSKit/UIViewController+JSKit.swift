//
//  UIViewController+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 06/02/15.
//

import UIKit

extension UIViewController {

    func showAlertWithTitle(title: String?, message: String?) {
        self.showAlertWithTitle(title, message: message, completion: nil)
    }

    func showAlertWithTitle(title: String?, message: String?, completion: (() -> Void)?) {
        let theTitle = (title == nil ? "Error" : title)
        let theMessage = (message == nil ? "An error occured, please try again." : message)
        let controller = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .Alert)
        controller.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        self.presentViewController(controller, animated: true, completion: completion)
    }
}
