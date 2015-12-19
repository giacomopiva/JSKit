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
    func addImageRightBarItem(image: UIImage) -> UIImageView {
        let imageView = UIImageView(image: image);
        imageView.frame = CGRectMake(kScreenWidth-image.size.width-5, 5, image.size.width, image.size.height);
        self.addSubview(imageView);
        return imageView;
    }
}

extension UINavigationItem {
    
    /**
	 * This method create a Title and Subtitle style header for the 
	 * Navigation Bar.
     */
    func setHeaderWithTitleAndSubtitle(title:String, subtitle:String) {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.text = title
        titleLabel.font = UIFont.systemFontOfSize(16.0)
        titleLabel.textColor = UIColor.lightGrayColor()
        headerView.addSubview(titleLabel)
        
        let subTitleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 14))
        subTitleLabel.textAlignment = NSTextAlignment.Center
        subTitleLabel.text = subtitle
        subTitleLabel.font = UIFont.systemFontOfSize(12.0)
        subTitleLabel.textColor = UIColor.lightGrayColor()
        headerView.addSubview(subTitleLabel)
        
        self.titleView = headerView
    }
    
}
