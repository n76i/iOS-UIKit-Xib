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
    
    var shapeView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
//        animationShapeLayer()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
//        animationShapeLayer()
    }
    private func setupView() {
        Bundle.main.loadNibNamed("BoxView", owner: self)
        self.addSubview(containView)
        containView.frame = self.bounds
        containView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewOpen.layer.cornerRadius = 15
        openLabel.layer.cornerRadius = 15
        openLabel.clipsToBounds = true
        openLabel.layer.borderColor = UIColor(patternImage: UIImage.gradientButtonImage(bounds: containView.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])).cgColor
        openLabel.layer.borderWidth = 1
        contrainShapeView()
        animationShapeLayer()
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
    func openBox(image: String) {
        viewOpen.isHidden = false
        viewFlower.isHidden = true
        imageView.image = UIImage(named: image)
        openLabel.text = "MỞ"
        openLabel.textColor = .white
        viewOpen.applyGradient(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
    }
    func tapView() {
        let tapGestrue = UITapGestureRecognizer(target: self, action: #selector(updateView))
        viewOpen.addGestureRecognizer(tapGestrue)
    }
    @objc func updateView() {
        imageView.image = UIImage(named: "Rose")
        viewOpen.isHidden = true
        viewFlower.isHidden = false
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
        animationShapeLayer()
    }
    func stateWait(data: DataReward) {
        viewOpen.isHidden = false
        viewFlower.isHidden = true
        imageView.image = UIImage(named: data.imageName)
        openLabel.text = "Chờ đợi"
        openLabel.textColor = UIColor(patternImage: UIImage.gradientButtonImage(bounds: openLabel.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!]))
    }
    func countDown(value: Int) {
        openLabel.text = value.convertToMinutes()
    }
    func animationShapeLayer() {
        //MARK: - shapeLayer
        shapeLayer.path = genPath().cgPath
        shapeLayer.lineWidth = 3.0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeView.frame = viewOpen.bounds
        shapeView.layer.addSublayer(shapeLayer)
    }
    func genPath() -> UIBezierPath {
        // Initialize the path.
        let bounds = viewOpen.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.height/2))
        path.addArc(withCenter: CGPoint(x: bounds.height/2, y: bounds.height/2), radius: bounds.height/2, startAngle: -CGFloat.pi, endAngle: -CGFloat.pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: bounds.width - bounds.height/2, y: 0))
        path.addArc(withCenter: CGPoint(x: bounds.width - bounds.height/2, y: bounds.height/2), radius: bounds.height/2, startAngle: -CGFloat.pi/2, endAngle: CGFloat.pi/2, clockwise: true)
        path.addLine(to: CGPoint(x: bounds.height/2, y: bounds.height))
        path.addArc(withCenter: CGPoint(x: bounds.height/2, y: bounds.height/2), radius: bounds.height/2, startAngle: CGFloat.pi/2, endAngle: CGFloat.pi, clockwise: true)
        path.close()
        return path
    }
    func startAnimation(seconds: Int) {
        let basicAnmation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnmation.toValue = 1
        basicAnmation.duration = CFTimeInterval(seconds)
        basicAnmation.fillMode = CAMediaTimingFillMode.forwards
        basicAnmation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnmation, forKey: "basicAnimation")
        
    }
    func contrainShapeView() {
        viewOpen.addSubview(shapeView)
        NSLayoutConstraint.activate([
            shapeView.topAnchor.constraint(equalTo: viewOpen.topAnchor, constant: 0),
            shapeView.leftAnchor.constraint(equalTo: viewOpen.leftAnchor, constant: 0),
            shapeView.rightAnchor.constraint(equalTo: viewOpen.rightAnchor, constant: 0),
            shapeView.bottomAnchor.constraint(equalTo: viewOpen.bottomAnchor, constant: 0)
        ])
    }
   
}
