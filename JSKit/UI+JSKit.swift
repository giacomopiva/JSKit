//
//  UI+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 12/01/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

class JSKit: NSObject {
    
    /**
     *  Apply Rotate Effect to a view
     */
    static func applySpinAnimationToView(view:UIView, degree:Double, duration:Double) {
        UIView.beginAnimations("rotate", context: nil)
        UIView.setAnimationDuration(duration)
        view.transform = CGAffineTransformMakeRotation(CGFloat(degree / 180.0 * M_PI))
        UIView.commitAnimations()
    }
    
    /**
     *  Apply Fade In Effect to a view
     */
    static func applyFadeInEffectToView(view: UIView, duration: Double) {
        view.alpha = 0.0
        UIView.animateWithDuration(duration) { () -> Void in
            view.alpha = 1.0
        }
    }
    
    /**
     *  Apply Fade In Effect to a view with completion handler
     */
    static func applyFadeInEffectToView(view: UIView, duration: Double, completion: ((complete: Bool) -> Void)) {
        view.alpha = 0.0
        UIView.animateWithDuration(duration, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            view.alpha = 1.0
            }) { (complete: Bool) -> Void in
                completion(complete: true)
        }
    }
    
    /**
     *  Apply Fade Out Effect to a view
     */
    static func applyFadeOutEffectToView(view: UIView, duration: Double) {
        view.alpha = 1.0
        UIView.animateWithDuration(duration) { () -> Void in
            view.alpha = 0.0
        }
    }
    
    /**
     *  Apply Fade Out Effect to a view with completion handler
     */
    static func applyFadeOutEffectToView(view: UIView, duration: Double, completion: ((complete: Bool) -> Void)) {
        view.alpha = 1.0
        UIView.animateWithDuration(duration, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            view.alpha = 0.0
            }) { (complete: Bool) -> Void in
                completion(complete: true)
        }
    }
    
    /**
     *  Apply rounded corner to a view
     */
    static func applyRoundCornerToView(view:UIView, radius:Float = 5) {
        view.layer.cornerRadius = CGFloat(radius)
        view.layer.masksToBounds = true
    }
    
    /**
     *  Apply Border to a view
     */
    static func applyBorderToView(view:UIView, thickness:Float = 1.0, color:UIColor = UIColor.blackColor()) {
        view.layer.borderWidth = CGFloat(thickness)
        view.layer.borderColor = color.CGColor
    }
    
    /**
     *  Apply Light Shadow Effect to a view
     */
    static func applyLightShadowToView(view:UIView, color:UIColor = UIColor.lightGrayColor()) {
        view.layer.shadowColor = color.CGColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSizeMake(0, 0)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
    }
    
    /**
     *  Apply the Blur Effect to a view
     */
    static func applyBlurEffectToView(view:UIView, blurEffectStyle:UIBlurEffectStyle = .Dark) {
        view.backgroundColor = UIColor.clearColor();
        let blurEffect:UIVisualEffect = UIBlurEffect(style:blurEffectStyle)
        let visualEffectView:UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)
        view.addSubview(visualEffectView)
    }
    
    /**
     *  Apply a Gradient Background to a view
     */
    static func applyGradientBackgroudToView(view:UIView, fromColor:UIColor, toColor:UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [fromColor.CGColor, toColor.CGColor]
        view.layer.insertSublayer(gradient, atIndex: 0)
    }
}
