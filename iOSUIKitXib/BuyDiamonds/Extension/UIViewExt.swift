//
//  UIViewExt.swift
//  iOSUIKitXib
//
//  Created by HungND on 28/12/2022.
//

import Foundation
import UIKit

extension UIView {
    func applyGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint, shape: CAShapeLayer?, corner: CGFloat) {
        self.backgroundColor = .white
        self.layer.backgroundColor = UIColor.white.cgColor
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRect(origin: CGPoint.zero, size: self.bounds.size)
        gradient.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        if(shape != nil) {
            shape!.path = UIBezierPath(roundedRect: gradient.frame, cornerRadius: corner).cgPath
            
            gradient.mask = shape
        }
        
        self.layer.insertSublayer(gradient, at: 0)//addSublayer(gradient)

    }
    
    func createGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint, shape: CAShapeLayer?, corner: CGFloat) -> CAGradientLayer {
        
        let gradient: CAGradientLayer!
        if let sub = layer.sublayers?.first as? CAGradientLayer {
                    gradient = sub
                } else {
                    gradient = CAGradientLayer()
                    self.layer.insertSublayer(gradient, at: 0)
                }
        gradient.frame = CGRect(origin: CGPoint.zero, size: self.bounds.size)
        gradient.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        
        if(shape != nil) {
            shape!.path = UIBezierPath(roundedRect: gradient.frame, cornerRadius: corner).cgPath
            
            gradient.mask = shape
        }
        
        return gradient
    }
        
    @discardableResult
    func gradientBorder(colors: [UIColor], isVertical: Bool, isStroker: Bool = true) -> CAGradientLayer {
        self.layer.masksToBounds = true
        
        //Create gradient layer
        let gradient = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })
        
        //Set gradient direction
        if(isVertical){
            gradient.startPoint = CGPoint(x: 0.5, y: 0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1)
        }
        else {
            gradient.startPoint = CGPoint(x: 0.1, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.5)
        }
        
        //Create shape layer
        if(isStroker) {
            let shape = CAShapeLayer()
            shape.lineWidth = 1.5
            shape.path = UIBezierPath(roundedRect: gradient.frame.insetBy(dx: 1, dy: 1), cornerRadius: self.layer.cornerRadius).cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.fillColor = UIColor.clear.cgColor
            gradient.mask = shape
        }
        
        //Add layer to view
        self.layer.insertSublayer(gradient, at: 0)
        //        gradient.zPosition = 0
        return gradient
    }
    
    func roundCorners(_ corners: [CACornerMask], radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, ]
    }
    
    //    func _round(corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
    //     let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    //     let mask = CAShapeLayer()
    //     mask.path = path.cgPath
    //     self.layer.mask = mask
    //     return mask
    //    }
}

extension CACornerMask {
    static let bottomLeft = CACornerMask.layerMinXMaxYCorner
    static let bottomRight = CACornerMask.layerMaxXMaxYCorner
    static let topLeft = CACornerMask.layerMinXMinYCorner
    static let topRight = CACornerMask.layerMaxXMinYCorner
}
