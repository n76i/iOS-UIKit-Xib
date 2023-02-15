//
//  UIViewSelec.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 15/01/2023.
//

import Foundation
import UIKit

extension UIView {
    
    func gradientColor(colors: [UIColor]? = nil,bounds: CGRect?) -> UIColor? {
            let bounds = bounds ?? frame
            let gradient = CAGradientLayer()
            gradient.frame = bounds
            //order of gradient colors
            if let colors {
                gradient.colors = colors.map(\.cgColor)
            } else {
//                let leftColor = Color.Gradient.secondaryStart.color
//                let rightColor = Color.Gradient.secondaryEnd.color
//                gradient.colors = [leftColor, rightColor].map(\.cgColor)
            }
            // start and end points
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
            UIGraphicsBeginImageContext(gradient.bounds.size)
            //create UIImage by rendering gradient layer.
            gradient.render(in: UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            //get gradient UIcolor from gradient UIImage
            return UIColor(patternImage: image!)
        }
    
    
    func setGradientBorder(
           width: CGFloat,
           colors: [UIColor],
           startPoint: CGPoint = CGPoint(x: 0.5, y: 0),
           endPoint: CGPoint = CGPoint(x: 0.5, y: 1)
       ) {
//           let existedBorder = CAGradientLayer()
           let gradient = CAGradientLayer()
           gradient.frame = bounds
           gradient.colors = colors.map { return $0.cgColor }
           gradient.startPoint = startPoint
           gradient.endPoint = endPoint
           
           let mask = CAShapeLayer()
           mask.path = UIBezierPath(roundedRect: bounds, cornerRadius: 8).cgPath
           mask.fillColor = UIColor.clear.cgColor
           mask.strokeColor = UIColor.white.cgColor
           mask.lineWidth = width
           
           gradient.mask = mask
           layer.addSublayer(gradient)
//           let exists = existedBorder != nil
//           if !exists {
//               layer.addSublayer(gradient)
//           }
       }
    func gradientButton(_ buttonText: UIButton, startColor:UIColor, endColor:UIColor) {
        //        var button = buttonText
        //        button = UIButton(frame: self.bounds)
        var button: UIButton = UIButton(frame: self.bounds)
        button = buttonText
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        self.mask = button
        //        // Create a gradient layer
        //        let gradient = CAGradientLayer()
        //
        //        // gradient colors in order which they will visually appear
        //        gradient.colors = [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!]
        //
        //        // Gradient from left to right
        //        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        //        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        //
        //        // set the gradient layer to the same size as the view
        //        gradient.frame = viewDiamondButton.bounds
        //
        //        // add the gradient layer to the views layer for rendering
        //        viewDiamondButton.layer.insertSublayer(gradient, at: 0)
        //
        //        // Tha magic! Set the button as the views mask
        //        viewDiamondButton.mask = diamondButton
        
    }
    func gradientButton2(_ view: UIView, _ buttonText: UIButton, startColor:UIColor, endColor:UIColor) {
        
        var view1: UIView = UIView(frame: self.bounds)
        view1 = view
        var button: UIButton = UIButton(frame: view1.bounds)
        button = buttonText
        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = view1.bounds
        view1.layer.insertSublayer(gradient, at: 0)
        view1.mask = button
    }

    
    func applyGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint, shape: CAShapeLayer?, corner: CGFloat) {
        var gradient: CAGradientLayer!
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
//        print(self.frame)
//        print(gradient.frame)
     

//        self.layer.insertSublayer(gradient, at: 0)//addSublayer(gradient)
        
//        for i in 0..<(self.layer.sublayers?.count ?? 0) - 1 {
//            if(i>=1) {
//                self.layer.sublayers?.remove(at: i)
//            }
//        }
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
