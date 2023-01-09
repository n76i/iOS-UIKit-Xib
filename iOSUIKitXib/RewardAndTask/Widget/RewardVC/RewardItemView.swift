//
//  RewardItemView.swift
//  iOSUIKitXib
//
//  Created by HungND on 03/01/2023.
//

import UIKit

class RewardItemView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var numberReward: UILabel!
    @IBOutlet weak var nameReward: UILabel!
    
    @IBOutlet weak var labelStaticView: UILabel!
    @IBOutlet weak var staticView: UIView!
    
    weak var delegate: ButtonTapDelegate?
    
    let shape = CAShapeLayer()
    
    unowned var dataModel: RewardModelView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    func initView() {
        Bundle.main.loadNibNamed("RewardItemView", owner: self)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(contentView)
                
        staticView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.openBox(_:))))
    }
    
    func setupView(data: RewardModelView) {
        dataModel = data
//        staticView.frame = CGRect(x: 29.999999999999996, y: 99.0, width: 36.666666666666664, height: 26.0)
        
        //setup state view
        switch data.type {
        ////đang chờ để đếm thời gian
        case .awaiting:
            awaitingFunc(data: data)
            
        //đang đếm thời gian
        case .count_down:
            countdownFunc(data: data)
        //đã có thể mở được quà
        case .open:
            openFunc(data: data)
            
        //đã mở quà và đã ẩn hiển thị quà
        case .opened:
            openedFunc(data: data)
            
        //vừa mở quà xong và chưa ẩn hiển thị phần quà
        case .just_opened:
            justOpenedFunc(data: data)
        }
    }
    
    func awaitingFunc(data: RewardModelView) {
        staticView.isHidden = false
        messageView.isHidden = true
        
        //setup view
        staticView.layer.cornerRadius = 12
        staticView.layer.borderWidth = 1
        staticView.layer.borderColor = UIColor(named: "D9D9D9")?.cgColor
        staticView.layer.masksToBounds = true

        labelStaticView.text = "Chờ đợi"
        
        imgView.image = UIImage(named: data.imageName)
    }
    
    func countDown(value: Int) {
        labelStaticView.text = value.convertToMinutes()
    }
    
    func countdownFunc(data: RewardModelView) {
        staticView.isHidden = false
        messageView.isHidden = true
        imgView.image = UIImage(named: data.imageName)

        //setup view
        staticView.layer.cornerRadius = 12
        staticView.layer.borderWidth = 1
        staticView.layer.borderColor = UIColor(named: "D9D9D9")?.cgColor
        staticView.layer.masksToBounds = true
        labelStaticView.text = "00:05"
        
        labelStaticView.gradientColorText(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])
    }
    
    func openFunc(data: RewardModelView) {
        staticView.isHidden = false
        messageView.isHidden = true
        labelStaticView.text = "MỞ"
        labelStaticView.textColor = .white
        imgView.image = UIImage(named: data.imageName)
        staticView.layoutIfNeeded()
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .mi(1)) { [weak self] in
//            self?.staticView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.8), endPoint: CGPoint(x: 1.0, y: 0.2), shape: self?.shape, corner: 30)
        
        staticView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.8), endPoint: CGPoint(x: 1.0, y: 0.2), shape: shape, corner: 30)
    }
    
    func openedFunc(data: RewardModelView) {
        staticView.isHidden = false

        messageView.isHidden = true
        imgView.image = UIImage(named: data.imageName)
        
        //setup background
        staticView.layer.cornerRadius = 12
        staticView.layer.borderWidth = 0
        staticView.backgroundColor = UIColor(named: "DED8D8")
        labelStaticView.textColor = UIColor(named: "9B9999")
        labelStaticView.text = "Đã mở"
    }
    
    func justOpenedFunc(data: RewardModelView) {
        staticView.isHidden = true
        messageView.isHidden = false
        imgView.image = UIImage(named: "flower_ic")
        nameReward.text = data.rewardName
        numberReward.text = "x" + String(data.numberReward)
    }
    
    @objc func openBox(_ sender: Any) {
        if(dataModel.type == RewardType.open) {
            delegate?.ontapReward(item: dataModel)
        }
    }
}
