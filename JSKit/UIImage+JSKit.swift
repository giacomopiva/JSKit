//
//  UIImage+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 16/11/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

extension UIImage {
    
    /**
     *  Create an UIImage from View
     *  In other words it create a snapshot of the view
     */
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }

    /**
     *  Return an UIImage resized with @newSize and scaled to
     *  @scaled. Set @hasAlpha to true if the image has a transparent
     *  backgroung or other transparent parts.
     */
    static func imageWithImage(_ image: UIImage, newSize: CGSize, scale: CGFloat = 0.0, hasAlpha: Bool = false)-> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, !hasAlpha, scale)
        image.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()        
        return scaledImage!
    }

}
