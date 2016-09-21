//
//  UINavigationBar+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 19/04/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

extension UINavigationBar {
   
    /**
	 * This method puts an imahe in the right side of the Navigation Bar.
	 * It is quite usefull if you want to add a company logo or something
	 * similar.
     */
    func addImageRightBarItem(_ image: UIImage) -> UIImageView {
        let imageView = UIImageView(image: image);
        imageView.frame = CGRect(x: kScreenWidth-36-5, y: 5, width: 36, height: 36);
        self.addSubview(imageView);
        return imageView;
    }
}

extension UINavigationItem {
    
    /**
	 * This method create a Title and Subtitle style header for the 
	 * Navigation Bar.
     */
    func setHeaderWithTitleAndSubtitle(_ title:String, subtitle:String) {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16.0)
        titleLabel.textColor = UIColor.lightGray
        headerView.addSubview(titleLabel)
        
        let subTitleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 14))
        subTitleLabel.textAlignment = NSTextAlignment.center
        subTitleLabel.text = subtitle
        subTitleLabel.font = UIFont.systemFont(ofSize: 12.0)
        subTitleLabel.textColor = UIColor.lightGray
        headerView.addSubview(subTitleLabel)
        
        self.titleView = headerView
    }
    
}
