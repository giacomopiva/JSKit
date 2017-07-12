//
//  Foundation+JSKit.swift
//  JSKit
//
//  Created by Giacomo Piva on 13/01/16.
//  Copyright (c) 2015 Giacomo Piva. All rights reserved.
//

import UIKit

extension Int {
    var degreesToRadians: CGFloat {
        return CGFloat(self) * CGFloat(Double.pi) / 180.0
    }
}

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Float {
    func roundTo(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
