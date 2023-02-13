//
//  HeaderViewLive.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/02/2023.
//

import UIKit

class HeaderViewLive: UIView {

    @IBOutlet var containView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed("HeaderViewLive", owner: self)
        self.addSubview(containView)
        containView.frame = self.bounds
        containView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
