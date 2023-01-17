//
//  LineView.swift
//  iOSUIKitXib
//
//  Created by HungND on 30/12/2022.
//

import UIKit

class LineView: UIView {
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var subView: UIView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        Bundle.main.loadNibNamed("LineView", owner: self)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        self.addSubview(contentView)
        
        subView.applyGradient(colors: [ UIColor(named: "SweetCandiedPurple")!, UIColor(named: "PortlandOrange")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
    }
}
