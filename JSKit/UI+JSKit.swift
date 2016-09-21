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
    static func applySpinAnimationToView(_ view:UIView, degree:Double, duration:Double) {
        UIView.beginAnimations("rotate", context: nil)
        UIView.setAnimationDuration(duration)
        view.transform = CGAffineTransform(rotationAngle: CGFloat(degree / 180.0 * M_PI))
        UIView.commitAnimations()
    }
    
    /**
     *  Apply Fade In Effect to a view
     */
    static func applyFadeInEffectToView(_ view: UIView, duration: Double) {
        view.alpha = 0.0
        UIView.animate(withDuration: duration, animations: { () -> Void in
            view.alpha = 1.0
        }) 
    }
    
    /**
     *  Apply Fade In Effect to a view with completion handler
     */
    static func applyFadeInEffectToView(_ view: UIView, duration: Double, completion: @escaping ((_ complete: Bool) -> Void)) {
        view.alpha = 0.0
        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            view.alpha = 1.0
            }) { (complete: Bool) -> Void in
                completion(true)
        }
    }
    
    /**
     *  Apply Fade Out Effect to a view
     */
    static func applyFadeOutEffectToView(_ view: UIView, duration: Double) {
        view.alpha = 1.0
        UIView.animate(withDuration: duration, animations: { () -> Void in
            view.alpha = 0.0
        }) 
    }
    
    /**
     *  Apply Fade Out Effect to a view with completion handler
     */
    static func applyFadeOutEffectToView(_ view: UIView, duration: Double, completion: @escaping ((_ complete: Bool) -> Void)) {
        view.alpha = 1.0
        UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            view.alpha = 0.0
            }) { (complete: Bool) -> Void in
                completion(true)
        }
    }
    
    /**
     *  Apply rounded corner to a view
     */
    static func applyRoundCornerToView(_ view:UIView, radius:Float = 5) {
        view.layer.cornerRadius = CGFloat(radius)
        view.layer.masksToBounds = true
    }
    
    /**
     *  Apply Border to a view
     */
    static func applyBorderToView(_ view:UIView, thickness:Float = 1.0, color:UIColor = UIColor.black) {
        view.layer.borderWidth = CGFloat(thickness)
        view.layer.borderColor = color.cgColor
    }
    
    /**
     *  Apply Light Shadow Effect to a view
     */
    static func applyLightShadowToView(_ view:UIView, color:UIColor = UIColor.lightGray) {
        view.layer.shadowColor = color.cgColor
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
    }
    
    /**
     *  Apply the Blur Effect to a view
     */
    static func applyBlurEffectToView(_ view:UIView, blurEffectStyle:UIBlurEffectStyle = .dark) {
        view.backgroundColor = UIColor.clear;
        let blurEffect:UIVisualEffect = UIBlurEffect(style:blurEffectStyle)
        let visualEffectView:UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        view.addSubview(visualEffectView)
    }
    
    /**
     *  Apply a Gradient Background to a view
     */
    static func applyGradientBackgroudToView(_ view:UIView, fromColor:UIColor, toColor:UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [fromColor.cgColor, toColor.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
}
