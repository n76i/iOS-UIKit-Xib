//
//  UIViewExt.swift
//  iOSUIKitXib
//
//  Created by HungND on 28/12/2022.
//

import Foundation
import UIKit

extension UIView {
    //    func applyGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint, shape: CAShapeLayer?) {
    //        let gradient = CAGradientLayer()
    //        gradient.frame = CGRect(origin: CGPoint.zero, size: self.bounds.size)
    //        gradient.colors = colors.map({ (color) -> CGColor in
    //            color.cgColor
    //        })
    //
    //        gradient.startPoint = startPoint
    //        gradient.endPoint = endPoint
    //
    //        if(shape != nil) {
    //            shape!.path = UIBezierPath(roundedRect: gradient.frame.insetBy(dx: 1, dy: 1), cornerRadius: 30.0).cgPath
    //
    //            gradient.mask = shape
    //        }
    //
    //        self.layer.addSublayer(gradient)
    //    }
    
    //    func gradientBorder(colors: [UIColor], isVertical: Bool, isStroker: Bool = true){
    //        self.layer.masksToBounds = true
    //
    //        //Create gradient layer
    //        let gradient = CAGradientLayer()
    //        gradient.frame = CGRect(origin: CGPoint.zero, size: self.bounds.size)
    //        gradient.colors = colors.map({ (color) -> CGColor in
    //            color.cgColor
    //        })
    //
    //        //Set gradient direction
    //        if(isVertical){
    //            gradient.startPoint = CGPoint(x: 0.5, y: 0)
    //            gradient.endPoint = CGPoint(x: 0.5, y: 1)
    //        }
    //        else {
    //            gradient.startPoint = CGPoint(x: 0.1, y: 0.5)
    //            gradient.endPoint = CGPoint(x: 0.5, y: 0.5)
    //        }
    //
    //        //Create shape layer
    //        if(isStroker) {
    //            let shape = CAShapeLayer()
    //            shape.lineWidth = 1.5
    //            shape.path = UIBezierPath(roundedRect: gradient.frame.insetBy(dx: 1, dy: 1), cornerRadius: self.layer.cornerRadius).cgPath
    //            shape.strokeColor = UIColor.black.cgColor
    //            shape.fillColor = UIColor.clear.cgColor
    //            gradient.mask = shape
    //        }
    //
    //        //Add layer to view
    //        self.layer.addSublayer(gradient)
    ////        gradient.zPosition = 0
    //    }
    
    //    func genderData() {
    //        if var item0 = dataReward.first(where: {$0.stateReward == .countDown}) {
    //            item0.stateReward = .open
    //            if let index = dataReward.firstIndex(where: {$0.stateReward == .countDown}) {
    //                dataReward[index] = item0
    ////                print(index)
    //            }
    //        }
    //        if var item1 = dataReward.first(where: {$0.stateReward == .wait}) {
    //            item1.stateReward = .countDown
    //            if let index = dataReward.firstIndex(where: {$0.stateReward == .wait}) {
    //                dataReward[index] = item1
    //            }
    //        }
    //        indexCountDown()
    //        updateViewTimer()
    //        updateView()
    ////        isHiddenShapeView()
    ////        setupView()
    //        if dataReward.first(where: {$0.stateReward == .countDown}) != nil {
    //            setTimer()
    //        } else {
    //            self.timeLeft = 5
    //            self.timer?.invalidate()
    //            self.timer = nil
    //        }
    //    }
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
