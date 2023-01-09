//
//  RewardView.swift
//  iOSUIKitXib
//
//  Created by HungND on 30/12/2022.
//

import UIKit

class RewardView: UIView {
    
    @IBOutlet weak var superOfView: UIView!
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var view1: RewardItemView!
    @IBOutlet weak var view2: RewardItemView!
    @IBOutlet weak var view3: RewardItemView!
    @IBOutlet weak var view4: RewardItemView!
    @IBOutlet weak var view5: RewardItemView!
    @IBOutlet weak var view6: RewardItemView!
        
    var dataReward: [RewardModelView] = [
        RewardModelView(imageName: "gift_box_1_ic", rewardName: "Hoa hồng", numberReward: 1000, type: RewardType.opened),
        RewardModelView(imageName: "gift_box_1_ic", rewardName: "Hoa hồng", numberReward: 1000, type: RewardType.just_opened),
        RewardModelView(imageName: "gift_box_2_ic", rewardName: "Hoa hồng", numberReward: 1000, type: RewardType.open),
        RewardModelView(imageName: "gift_box_3_ic", rewardName: "Hoa hồng", numberReward: 1000, type: RewardType.count_down),
        RewardModelView(imageName: "gift_box_4_ic", rewardName: "Hoa hồng", numberReward: 1000, type: RewardType.awaiting),
        RewardModelView(imageName: "gift_box_5_ic", rewardName: "Hoa hồng", numberReward: 1000, type: RewardType.awaiting),
    ]

    var seconds: Int = 5
    var myTimer: Timer?
    var indexCountDown: Int = -1
    
    func findIndexCountDown() {
        for i in 0..<dataReward.count {
            if(dataReward[i].type == RewardType.count_down) {
                indexCountDown = i
            }
        }
    }
    
    func startCountdown() {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            self?.seconds -= 1
            if self?.seconds == -1 {
                print("Go!")
                self?.changeCountDown()
            } else if let seconds = self?.seconds {
                
                switch self?.indexCountDown {
                case 0:
                    self?.view1.countDown(value: seconds)
                case 1:
                    self?.view2.countDown(value: seconds)
                case 2:
                    self?.view3.countDown(value: seconds)
                case 3:
                    self?.view4.countDown(value: seconds)
                case 4:
                    self?.view5.countDown(value: seconds)
                case 5:
                    self?.view6.countDown(value: seconds)
                default: break
                    
                }
            }
        }
    }
    
    func changeCountDown() {
        dataReward[indexCountDown].type = RewardType.open

        if(indexCountDown < 5) {
            seconds = 5
            dataReward[indexCountDown + 1].type = RewardType.count_down
            indexCountDown += 1;
        } else {
            indexCountDown = 0
            myTimer?.invalidate()
        }
        
        findIndexCountDown()

        setupView()
    }
    
    deinit {
        // ViewController going away.  Kill the timer.
        myTimer?.invalidate()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    func initView() {
        //tìm vị trí đếm ngược
        findIndexCountDown()
        
        if(indexCountDown != -1) {
            startCountdown()
        }
        
        Bundle.main.loadNibNamed("RewardView", owner: self)
        self.addSubview(superOfView)
        superOfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        superOfView.frame = self.bounds
        setupView()
    }
    
    func setupView() {
//        let widthItem = (UIScreen.main.bounds.size.width - 140 )/3
        
        //setup view 6
//        view6.bounds.size.width = widthItem
//        let subView6 = RewardItemView()
//        subView6.frame = view6.bounds
//        subView6.setupView(data: dataReward[5])
//        view6.addSubview(subView6)
//        subView6.delegate = self
        
        view1.setupView(data: dataReward[0])
        view1.delegate = self
        
        view2.setupView(data: dataReward[1])
        view2.delegate = self

        view3.setupView(data: dataReward[2])
        view3.delegate = self

        view4.setupView(data: dataReward[3])
        view4.delegate = self

        view5.setupView(data: dataReward[4])
        view5.delegate = self

        view6.setupView(data: dataReward[5])
        view6.delegate = self
    }
}

extension RewardView: ButtonTapDelegate {
    func ontapReward(item: RewardModelView) {
        for i in dataReward {
            if(i === item) {
                print("abc")

                i.type = RewardType.just_opened
                setupView()
            }
        }
    }
}
