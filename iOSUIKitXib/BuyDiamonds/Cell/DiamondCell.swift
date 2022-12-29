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
    
    private var borderGradient: CAGradientLayer!
    
    var sizeOfView: CGSize!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 8
    }
    
    func setupView(model: DiamondModel) {
        view.frame.size = sizeOfView

        diamondNumber.text = String(model.diamondNumber)
        moneyTxt.text = model.money.description + " vnđ"
        
        if(model.isSelect) {
            view.backgroundColor = UIColor(named: "FFFAE3")
            if borderGradient == nil {
                borderGradient = view.gradientBorder(colors: [UIColor(named: "D2AC48")!, UIColor(named: "EBD56D")!, UIColor(named: "FDFB93")!, UIColor(named: "D7B14C")!], isVertical: false)
            } else {
                view.layer.addSublayer(borderGradient)
            }
        } else {
            if borderGradient != nil {
                borderGradient.removeFromSuperlayer()
                borderGradient = nil
            }
            view.backgroundColor = UIColor(named: "F5F5F5")
        }
        
    }
}


