//
//  UILabelExt.swift
//  iOSUIKitXib
//
//  Created by HungND on 05/01/2023.
//

import Foundation
import UIKit

extension UILabel {
    func gradientColorText(colors: [UIColor]) {
        let gradient = getGradientLayer(bounds: self.bounds, colors: colors)
        self.textColor = gradientColor(bounds: self.bounds, gradientLayer: gradient)
    }
    
    func gradientColor(bounds: CGRect, gradientLayer :CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        //create UIImage by rendering gradient layer.
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //get gradient UIcolor from gradient UIImage
        return UIColor(patternImage: image!)
    }
    
    func getGradientLayer(bounds : CGRect, colors: [UIColor]) -> CAGradientLayer{
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        //order of gradient colors
        gradient.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        // start and end points
        gradient.startPoint = CGPoint(x: 0.0, y: 0.8)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.2)
        return gradient
    }
}
