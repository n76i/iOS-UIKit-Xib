//
//  BoxView.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 14/02/2023.
//

import UIKit

class BoxView: UIView {
    
    @IBOutlet var containView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var viewFlower: UIView!
    @IBOutlet weak var viewOpen: UIView!
    @IBOutlet weak var openLabel: UILabel!
    
    var dataReward: DataReward?
    
    var shapeLayer = CAShapeLayer()
    var shaeView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        Bundle.main.loadNibNamed("BoxView", owner: self)
        self.addSubview(containView)
        containView.frame = self.bounds
        containView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewOpen.layer.cornerRadius = 15
        contrainShapeView()
    }

    func setupView(data: DataReward) {
        self.dataReward = data
        
        switch data.stateReward {
        case .open:
           stateOpenBox(data: data)
        case .gotIt:
            stateGotIt(data: data)
        case .countDown:
            stateCoutdown(data: data)
        case .wait:
            stateWait(data: data)
        }
    }
    func stateOpenBox(data: DataReward) {
        viewOpen.isHidden = false
        viewFlower.isHidden = true
        imageView.image = UIImage(named: data.imageName)
        openLabel.text = "MỞ"
        openLabel.textColor = .white
        viewOpen.applyGradient(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
    }
    func stateGotIt(data: DataReward) {
        viewOpen.isHidden = true
        viewFlower.isHidden = false
        imageView.image = UIImage(named: data.imageName)
    }
    func stateCoutdown(data: DataReward) {
        viewOpen.isHidden = false
        viewFlower.isHidden = true
        imageView.image = UIImage(named: data.imageName)
        openLabel.text = "00:05"
        openLabel.textColor = UIColor(patternImage: UIImage.gradientButtonImage(bounds: openLabel.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!]))
        viewOpen.layer.borderWidth = 1
        viewOpen.layer.borderColor = UIColor(patternImage: UIImage.gradientButtonImage(bounds: viewOpen.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])).cgColor
    }
    func stateWait(data: DataReward) {
        viewOpen.isHidden = false
        viewFlower.isHidden = true
        imageView.image = UIImage(named: data.imageName)
        openLabel.text = "Chờ đợi"
        openLabel.textColor = UIColor(patternImage: UIImage.gradientButtonImage(bounds: openLabel.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!]))
        viewOpen.layer.borderWidth = 1
        viewOpen.layer.borderColor = UIColor(patternImage: UIImage.gradientButtonImage(bounds: viewOpen.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])).cgColor

    }
    func countDown(value: Int) {
        openLabel.text = value.convertToMinutes()
    }
    func contrainShapeView() {
        viewOpen.addSubview(shaeView)
        NSLayoutConstraint.activate([
            shaeView.topAnchor.constraint(equalTo: viewOpen.topAnchor),
            shaeView.leftAnchor.constraint(equalTo: viewOpen.leftAnchor),
            shaeView.rightAnchor.constraint(equalTo: viewOpen.rightAnchor),
            shaeView.bottomAnchor.constraint(equalTo: viewOpen.bottomAnchor)
        ])
    }
    
}
