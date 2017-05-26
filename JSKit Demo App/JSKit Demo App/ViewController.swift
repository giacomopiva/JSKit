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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Printing the model name of the device
        print(JSUtils.JSDeviceModelName())

        // Printing the system version
        print(JSUtils.JSDeviceSystemVersion())

        // Setting header with title and subtitle
        self.navigationItem.setHeaderWithTitleAndSubtitle("This is the title", subtitle: "This is the subtitle")
        
        // Using subscript for String object
        print("hello world!"[0])
        print("hello world!"[8])
        print("hello world!"[11])
        
        // Applying rounded corner to the UIView
        JSKit.applyRoundCornerToView(testView)
        
        // Applying spin animation to the UIView
        JSKit.applySpinAnimationToView(testView, degree: 180, duration: 0.7)
        
        // Add icon to the right side of the navigation bar afetr download it from network
        JSKit.downloadImage("http://placehold.it/40x40.png", completion: { (image) -> Void in
            if let imageView = self.navigationController?.navigationBar.addImageRightBarItem(image!) {
                JSKit.applyFadeInEffectToView(imageView, duration: 1.0)
            }
        })
        
        // Getting an HTTP response
        JSKit.responseForHTTPRequest("https://api.github.com/users/giacomopiva/repos") { (response) -> Void in
          print(response)
        }
        
        // Testing dates created from custom formats
        let d1 = Date.dateFromCustomFormatString("01/09/2015", format: "dd/MM/yyyy")!
        let d2 = Date.dateFromCustomFormatString("03/09/2015", format: "dd/MM/yyyy")!
        
        // Getting the number of days between two dates
        print("d2 is \(d2.daysFrom(d1)) days far from d1")
        
        // Showing date parts
        print("-> \(d1.day())/\(d1.month())/\(d1.year()) \(d1.hour()):\(d1.minute()):\(d1.second())")

        // Showing date in ISO format
        print("-> \(d1.ISOString())")

        // Starting an activity indicator
        let waitingView = self.testImageView.startLoadingActivity()
        
        // Downloading an image from internet and then stopping the animation
        JSKit.downloadImage("http://placehold.it/240x256.png", completion: { (image) -> Void in
            self.testImageView.image = image
            self.view.stopLoadingActivity(waitingView)
        })
    }
}
