//
//  ViewController.swift
//  JSKit
//
//  Created by Giacomo Piva on 06/02/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var testView: UIView!
    @IBOutlet weak var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationItem.setHeaderWithTitleAndSubtitle("This is the title", subtitle: "This is the subtitle")
        
        print("hello world!"[0])
        print("hello world!"[8])
        print("hello world!"[11])
        
        JSKit.applyRoundCornerToView(testView)
        
        JSKit.applySpinAnimationToView(testView, degree: 180, duration: 0.7)
        
        // Add icon to the right side of the navigation bar afetr download it from network
        JSKit.downloadImage("http://placehold.it/40x40.png", completion: { (image) -> Void in
            if let imageView = self.navigationController?.navigationBar.addImageRightBarItem(image!) {
                JSKit.applyFadeInEffectToView(imageView, duration: 1.0)
            }
        })
        
        JSKit.responseForHTTPRequest("https://api.github.com/users/giacomopiva/repos") { (response) -> Void in
          print(response)
        }
        
        let d1 = NSDate.dateFromCustomFormatString("01/09/2015", format: "dd/MM/yyyy")!
        let d2 = NSDate.dateFromCustomFormatString("03/09/2015", format: "dd/MM/yyyy")!
        
        print("d2 is \(d2.daysFrom(d1)) days far from d1")
        
        let waitingView = self.testImageView.startLoadingActivity()
        JSKit.downloadImage("http://placehold.it/360x666.png", completion: { (image) -> Void in
            self.testImageView.image = image
            self.view.stopLoadingActivity(waitingView)
        })
    }
}
