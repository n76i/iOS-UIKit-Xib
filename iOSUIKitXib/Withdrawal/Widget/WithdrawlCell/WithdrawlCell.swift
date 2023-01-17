//
//  WithdrawlCell.swift
//  iOSUIKitXib
//
//  Created by HungND on 11/01/2023.
//

import UIKit

class WithdrawlCell: UITableViewCell {
    @IBOutlet weak var stateTxt: UILabel!
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var titleDateTxt: UILabel!
    
    @IBOutlet weak var stackview: UIStackView!
    
    @IBOutlet weak var numberRubyValue: UILabel!
    @IBOutlet weak var numberRubyKey: UILabel!
    
    @IBOutlet weak var acountNumberKey: UILabel!
    @IBOutlet weak var acountNumberValue: UILabel!
    
    @IBOutlet weak var transactionNumberKey: UILabel!
    @IBOutlet weak var transactionNumberValue: UILabel!
    
    var gradientState: CAGradientLayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    func setupView() {
        self.contentView.frame = stackview.bounds
        
        titleDateTxt.font = UIFont.sarabunFont(type: .SarabunSemiBold, size: 14)
        stateTxt.font = UIFont.sarabunFont(type: .SarabunSemiBold, size: 12)
        
        numberRubyKey.font = UIFont.sarabunFont(type: .SarabunRegular, size: 14)
        numberRubyValue.font = UIFont.sarabunFont(type: .SarabunSemiBold, size: 14)
        
        acountNumberKey.font = UIFont.sarabunFont(type: .SarabunRegular, size: 14)
        acountNumberValue.font = UIFont.sarabunFont(type: .SarabunSemiBold, size: 14)
        
        transactionNumberKey.font = UIFont.sarabunFont(type: .SarabunRegular, size: 14)
        transactionNumberValue.font = UIFont.sarabunFont(type: .SarabunSemiBold, size: 14)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 8
        
        gradientState = stateView.createGradient(colors: [UIColor(named: "FFDFFC")!.withAlphaComponent(0), UIColor(named: "Tutu")!], startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0), shape: CAShapeLayer(), corner: 4)
        
        if let sub = stateView.layer.sublayers?.first as? CAGradientLayer {
            sub.removeFromSuperlayer()
        }
    }
    
    func setupData(data: Withdrawl) {
        titleDateTxt.text = data.dateTime
        setupState(state: data.state)
        numberRubyValue.text = String(data.rubyNumber.description)
        acountNumberValue.text = String(data.acountNumber)
        transactionNumberValue.text = String(data.transactionNumber )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        stateView.backgroundColor = .white
        stateView.layer.backgroundColor = UIColor.white.cgColor

        if let sub = stateView.layer.sublayers?.first as? CAGradientLayer {
            sub.removeFromSuperlayer()
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
            stateTxt.gradientColorText(colors: [UIColor(named: "SweetCandiedPurple")!, UIColor(named: "PortlandOrange")!])
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
