//
//  TabbarCell.swift
//  iOSUIKitXib
//
//  Created by HungND on 17/01/2023.
//

import UIKit

class TabbarCell: UICollectionViewCell {
    @IBOutlet weak var boundVIew: UIView!
    @IBOutlet weak var lineLeadingView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var lineBottomView: LineView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }

    func setupView() {
        contentView.frame = self.bounds
    }
    
    func setUpData(data: Tabbar, isShowLeadingLine: Bool) {
        titleLabel.text = data.state.rawValue
        titleLabel.font = UIFont.sarabunFont(type: .SarabunRegular, size: 14)

        if(isShowLeadingLine) {
            lineLeadingView.isHidden = false
        } else {
            lineLeadingView.isHidden = true
        }
        
        if(data.isSelect) {
            titleLabel.gradientColorText(colors: [UIColor(named: "SweetCandiedPurple")!, UIColor(named: "PortlandOrange")!])
            lineBottomView.isHidden = false
        } else {
            titleLabel.textColor = UIColor(named: "DarkLiver")
            lineBottomView.isHidden = true
        }
    }
}
