//
//  StringExt.swift
//  iOSUIKitXib
//
//  Created by HungND on 28/12/2022.
//

import Foundation
import UIKit

//extension String {
//    func getSize() -> CGSize {
//        let nsText = se as NSString?
//        return  nsText?.boundingRectWithSize(maxSize, options: [.TruncatesLastVisibleLine, .UsesLineFragmentOrigin], attributes: [NSFontAttributeName: fontName], context: nil).size
//    }
//}
extension UICollectionViewCell{
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
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
