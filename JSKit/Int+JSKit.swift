//
//  Int+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 13/01/16.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

extension Int {
    var degreesToRadians: CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}
