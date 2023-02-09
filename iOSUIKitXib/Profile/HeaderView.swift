//
//  HeaderView.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 09/02/2023.
//

import UIKit

class HeaderView: UIView {
    
    @IBOutlet var containView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    @IBAction func actionEvent(_ sender: Any) {
        
    }
    @IBAction func actionCenterLive(_ sender: Any) {
        
    }
    
    
    private func setupView() {
        Bundle.main.loadNibNamed("HeaderView", owner: self)
        self.addSubview(containView)
        containView.frame = self.bounds
        containView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}
