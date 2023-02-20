//
//  DiamondCell.swift
//  iOSUIKitXib
//
//  Created by HungND on 26/12/2022.
//

import UIKit

class DiamondCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var moneyTxt: UILabel!
    @IBOutlet weak var diamondNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupView(model: DiamondModel) {
        diamondNumber.text = String(model.diamondNumber)
        moneyTxt.text = model.money.description + " vnđ"
        view.frame = self.frame
        view.layer.cornerRadius = 8
    }
//
//    func setGradientBorder() {
//        let gradient = CAGradientLayer()
//        gradient.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
//        gradient.colors = [UIColor(named: "D2AC48")!, UIColor(named: "EBD56D")!, UIColor(named: "FDFB93")!, UIColor(named: "D7B14C")!]
//        let shape = CAShapeLayer()
//        shape.lineWidth = 1.5
//        gradient.mask = shape
//        view.layer.addSublayer(gradient)
//    }
}


