//
//  StringExt.swift
//  iOSUIKitXib
//
//  Created by HungND on 26/12/2022.
//

import Foundation

extension Int {
    var description: String {
        let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: self)
        return formatter.string(from: number)!
      }
    
}
