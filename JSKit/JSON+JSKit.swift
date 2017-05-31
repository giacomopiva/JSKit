//
//  JSON+JSKit.swift
//  Salvacuore
//
//  Created by Giacomo Piva on 31/05/17.
//  Copyright © 2017 UniFE. All rights reserved.
//

import UIKit

extension JSON {
    
    /**
     *  This function loads a json from the Bundle.
     */
    static func loadFrom(file filename: String) -> JSON? {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                return JSON(data)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        return nil
    }

}
