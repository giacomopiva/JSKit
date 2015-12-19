//
//  Network+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 06/02/15.
//

import UIKit

extension JSKit {

   /**
    *  Asynch download image at url passed as String
    */
    static func downloadImage(url: String, completion: (image: UIImage?) -> Void) {
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            let imageData = NSData(contentsOfURL: NSURL(string: url)!)
            dispatch_async(dispatch_get_main_queue()) {
                if let image = imageData {
                    completion(image: UIImage(data: image)!)
                } else {
                    completion(image: nil)
                }
            }
        }
    }
    
    /**
     *  Asynch get response for an HTTP request 
     *
     *  Example:
     *  JSKit.responseForHTTPRequest("http://...") { (response) -> Void in
     *      let data = response.objectForKey("data") as NSArray
     *      println(data.count)
     *  }
     *  
     *  WARNING: iOS 9 wants https connection only by default.
     *           If you are using an API with http connection
     *           don't forget to add the: 
     *              App Transport Security Settings
     *                  Allow Arbitrary Loads : YES
     *           key to your info.plist file.
     */
    static func responseForHTTPRequest(url: String, completion: (response: AnyObject) -> Void) {
        let request = NSURLRequest(URL: NSURL(string: url)!, cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5.0)
        let session = NSURLSession.sharedSession()
        session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
            let data: AnyObject! = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            completion(response: data != nil ? data! : [])
        }).resume()
    }
    
}
