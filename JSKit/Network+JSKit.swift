//
//  Network+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 06/02/15.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

extension JSKit {
    
    /**
     *  Asynch download image at url
     */
    static func downloadImage(_ url: String, completion: @escaping (_ image: UIImage?) -> Void) {
        let imageData = try? Data(contentsOf: URL(string: url)!)
        DispatchQueue.main.async {
            completion(UIImage(data: imageData!))
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
     *  WARNING: iOS > 9 wants https connection only by default.
     *           If you are using an API with http connection
     *           don't forget to add the:
     *              App Transport Security Settings
     *                  Allow Arbitrary Loads : YES
     *           key to your info.plist file.
     */
    static func responseForHTTPRequest(_ url: String, completion: @escaping (_ response: [AnyObject]) -> Void) {
        let request = URLRequest(url: URL(string: url)!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5.0)
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: {(data, response, error) in
            if error == nil {
                let data = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject!                
                completion(data != nil ? data! as! [AnyObject] : [])
            } else {
                print(error ?? "Error while getting HTTP response")
            }
            
            completion([])
        }).resume()
    }
    
}
