//
//  UIButton.swift
//  iOSUIKitXib
//
//  Created by HungND on 28/12/2022.
//

import Foundation
import UIKit

//extension UIButton {
//
//    func gradientColorText(colors: [UIColor]) {
//        let gradient = getGradientLayer(bounds: self.bounds, colors: colors)
//        self.textColor = gradientColor(bounds: self.bounds, gradientLayer: gradient)
//    }
//
//}

extension UIImage {
    static func gradientButtonImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)
        // This makes it left to right, default is top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
