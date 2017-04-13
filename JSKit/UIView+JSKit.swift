//
//  UIView+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 09/02/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /**
     * This methods create a UIViex froma a Xib file.
     */

    class func loadFromNib(_ name: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }

    /**
	 * This method create waiting wheel in the center of the view.
	 * It is usefull when you want to load data from network.
     *
     * @backgroundColor: The background color of the waitingView. Default black
     * @style: UIActivityIndicatorViewStyle. Default whithe
     * @ignoringEvents: Set true if you want to block all the interaction during the waiting time. Default false
     * @animating: Set true if you want a smooth fade in effect when it appears. Default true
     *
	 * Sample usage
	 * Supose you have a UIImageView and you are about to load the 
	 * image for that UIImageView from network, you can do something 
	 * similar:
     *       let waitingView = self.testImageView.startLoadingActivity()
     *       JSKit.downloadImage("http://placehold.it/360x666.png", completion: { (image) -> Void in
     *           self.testImageView.image = image
     *           self.view.stopLoadingActivity(waitingView)
     *       })
     */
	
    func startLoadingActivity(_ backgroundColor:UIColor = UIColor.black, style:UIActivityIndicatorViewStyle = .white, ignoringEvents:Bool = false, animating:Bool = true) -> UIView {
        let app = UIApplication.shared
        app.isNetworkActivityIndicatorVisible = true
        if ignoringEvents {
            app.beginIgnoringInteractionEvents()
        }
        let w = (self.frame.width - 50) / 2
        let h = ((self.frame.height - 50) / 2)
        let waitingView = UIView(frame: CGRect(x: w, y: h, width: 50, height: 50))
        waitingView.backgroundColor = backgroundColor
        let waitingSpin = UIActivityIndicatorView(activityIndicatorStyle:style)
        waitingSpin.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        waitingSpin.startAnimating()
        waitingView.addSubview(waitingSpin)
        self.addSubview(waitingView)
        if animating {
            JSKit.applyFadeInEffectToView(waitingView, duration:0.5)
        }

        return waitingView;
    }

    /**
     * This method removes a waiting view.
     *
     * @loadingView: the loading view created with startLoadingActivity method
     * @animating: Set true if you want a smooth fade in effect when it appears. Default true
     */
    func stopLoadingActivity(_ loadingView:UIView, animating:Bool = true) {
        let app = UIApplication.shared
        app.isNetworkActivityIndicatorVisible = false
        if app.isIgnoringInteractionEvents {
            app.endIgnoringInteractionEvents()
        }
        if animating {
            JSKit.applyFadeOutEffectToView(loadingView, duration:0.7)
        }
        loadingView.removeFromSuperview()
    }

}
