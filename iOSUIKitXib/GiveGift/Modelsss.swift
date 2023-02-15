//
//  Modelsss.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 14/02/2023.
//

import Foundation
import UIKit

enum StateReward {
    case open
    case gotIt
    case countDown
    case wait
}

class DataReward {
    var imageName: String
    var stateReward: StateReward
    
    init(imageName: String, stateReward: StateReward) {
        self.imageName = imageName
        self.stateReward = stateReward
    }
}

// MARK: - ButtonProgressView
public final class ButtonProgressView: UIView {

    public var isLineCapSquared: Bool = true { didSet { setNeedsLayout() } }

    public var lineWidth: CGFloat = 1.0 { didSet { setNeedsLayout() } }

    public var progressTintColor: UIColor = .black { didSet{ setNeedsLayout() } }

    public var trackTintColor: UIColor = .lightGray { didSet { setNeedsLayout() } }

//    public var progress: CGFloat {
//        get {
//            return progressLayer.strokeEnd
//        } set {
//            // Validate input & update progress line
//            if newValue >= 1 {
//                progressLayer.strokeEnd = 1
//            } else if newValue <= 0 {
//                progressLayer.strokeEnd = 0
//            } else {
//                progressLayer.strokeEnd = newValue
//            }
//        }
//    }

//    // Private
//    private let trackLayer = CAShapeLayer()
//    private let progressLayer = CAShapeLayer()
//    private var label = UILabel(frame: .zero)
//
//    // MARK: - Lifecycle
//    override public func layoutSubviews() {
//        super.layoutSubviews()
//
//    }
//
//    // MARK: - Initializers
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        configure()
//    }
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        configure()
//    }
//
//    public func configureLayer() {
//        label.textColor = gradientColor(bounds: bounds)
//        /// trackLayer
//        trackLayer.frame = bounds
//        trackLayer.path = genPath().cgPath
//        trackLayer.lineWidth = lineWidth
//        trackLayer.strokeColor = gradientColor(bounds: bounds)?.cgColor
//        trackLayer.lineCap = isLineCapSquared ? CAShapeLayerLineCap.square : CAShapeLayerLineCap.round
//        /// progressLayer
//        progressLayer.strokeStart = 0
//        progressLayer.frame = bounds
//        progressLayer.path = genPath().cgPath
//        progressLayer.lineWidth = lineWidth
//        progressLayer.strokeColor = Color.progressLayer.color.cgColor
//        progressLayer.lineCap = isLineCapSquared ? CAShapeLayerLineCap.square : CAShapeLayerLineCap.round
//    }
//
//    public func withTitle(_ text: String) {
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineHeightMultiple = 1.1
//        paragraphStyle.alignment = .center
//        let attributedText = NSMutableAttributedString(
//            string: text,
//            attributes: [
//                NSAttributedString.Key.paragraphStyle: paragraphStyle
//            ]
//        )
//        label.attributedText = attributedText
//    }

//    // MARK: - Methods
//    private func configure() {
//        addSubview(label)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        label.textAlignment = .center
//        label.font = .defaultSemibold(ofSize: FontSize.custom(12))
//        // Track layer
//        trackLayer.frame = bounds
//        trackLayer.fillColor = UIColor.clear.cgColor
//        layer.addSublayer(trackLayer)
//        // Progress layer
//        progressLayer.frame = bounds
//        progressLayer.fillColor = UIColor.clear.cgColor
//        layer.addSublayer(progressLayer)
//        progress = 0.0
//        // View
//        isUserInteractionEnabled = false
//        backgroundColor = UIColor.clear
//    }

    private func genPath() -> UIBezierPath {
        // Initialize the path.
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
}

