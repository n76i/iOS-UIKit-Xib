//
//  ToolbarView.swift
//  iOSUIKitXib
//
//  Created by HungND on 10/01/2023.
//

import UIKit

class ToolbarView: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var backBtn: UIButton!
    @IBOutlet private weak var titleTxt: UILabel!
    
    var delegate: ButtonTapDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    @IBAction func backBtn(_ sender: Any) {
        delegate?.ontapButton()
    }
    
    func setTitle(title: String) {
        titleTxt.text = title
    }
    
    func setupView() {
        Bundle.main.loadNibNamed("ToolbarView", owner: self)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(contentView)
        
        backBtn.setTitle("", for: .normal)
        backBtn.setImage(UIImage(named: "back_ic"), for: .normal)
        titleTxt.font = UIFont.sarabunFont(type: .SarabunSemiBold, size: 18)
        contentView.backgroundColor = .clear
    }
}
