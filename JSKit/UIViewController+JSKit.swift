//
//  UIViewController+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 06/02/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

extension UIViewController {

    func showAlertWithTitle(_ title: String?, message: String?) {
        self.showAlertWithTitle(title, message: message, completion: nil)
    }

    func showAlertWithTitle(_ title: String?, message: String?, completion: (() -> Void)?) {
        let theTitle = (title == nil ? "Error" : title)
        let theMessage = (message == nil ? "An error occured, please try again." : message)
        let controller = UIAlertController(title: theTitle, message: theMessage, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(controller, animated: true, completion: completion)
    }
    
    /**
        This is useful to dismiss the keyboard when you tap around the screen.
     
        Use self.hideKeyboardWhenTappedAround() in viewDidLoad() to get the behavior 
        automatically applied to all UITextField
     */
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
