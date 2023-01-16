//
//  Sarabun.swift
//  iOSUIKitXib
//
//  Created by HungND on 11/01/2023.
//

import Foundation
import UIKit

extension UIFont {
    public enum SarabunType: String {
        case SarabunBold = "Sarabun-Bold"
        case SarabunRegular = "Sarabun-Regular"
        case SarabunSemiBold = "Sarabun-SemiBold"
    }
    
    static func sarabunFont(type: SarabunType, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: type.rawValue, size: size)!
    }
}
