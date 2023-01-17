//
//  DetailWithdrawlCell.swift
//  iOSUIKitXib
//
//  Created by HungND on 13/01/2023.
//

import UIKit

class DetailWithdrawlCell: UITableViewCell {
    @IBOutlet weak var keyTxt: UILabel!
    @IBOutlet weak var valueTxt: UILabel!
    
    @IBOutlet weak var stateTxt: UILabel!
    @IBOutlet weak var stateView: UIView!
    
    var gradientState: CAGradientLayer!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
        
    }
    
    func setupView() {
        keyTxt.font = UIFont.sarabunFont(type: .SarabunRegular, size: 14)
        valueTxt.font = UIFont.sarabunFont(type: .SarabunRegular, size: 14)
        stateTxt.font = UIFont.sarabunFont(type: .SarabunSemiBold, size: 12)
        
        gradientState = stateView.createGradient(colors: [UIColor(named: "FFDFFC")!.withAlphaComponent(0), UIColor(named: "Tutu")!], startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0), shape: CAShapeLayer(), corner: 4)
        
        if let sub = stateView.layer.sublayers?.first as? CAGradientLayer {
            sub.removeFromSuperlayer()
        }
    }

    func setupData(data: DetailWithdrawlCellModel) {
        keyTxt.text = data.key
        
        if(data.value is String) {
            valueTxt.isHidden = false
            stateView.isHidden = true
            
            valueTxt.text = data.value as? String
        } else {
            valueTxt.isHidden = true
            stateView.isHidden = false
            
            setupState(state: data.value as! WithdrawlSate)
        }
    }
    
    func setupState(state: WithdrawlSate) {
        switch state {
        case .Success:
            stateView.backgroundColor = UIColor(named: "NeonNazar")
            stateView.layer.cornerRadius = 4
            
            stateTxt.text = state.rawValue
            stateTxt.textColor = .white
            
        case .Awaiting:
            stateTxt.gradientColorText(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])
            stateTxt.text = state.rawValue
            
            stateView.backgroundColor = .white
            stateView.layer.backgroundColor = UIColor.white.cgColor
            stateView.layer.insertSublayer(gradientState, at: 0)
            

        case .Failed:
            stateTxt.text = state.rawValue
            stateView.backgroundColor = UIColor(named: "WildWatermelon")
            stateView.layer.cornerRadius = 4
            
            stateTxt.textColor = .white
        case .All:
            break
        }
    }

}
