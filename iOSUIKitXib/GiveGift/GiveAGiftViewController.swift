//
//  GiveAGiftViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 14/02/2023.
//

import UIKit

class GiveAGiftViewController: UIViewController {
    
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var botImage1: UIImageView!
    @IBOutlet weak var botImage2: UIImageView!
    @IBOutlet weak var viewReward: UIView!
    
    @IBOutlet weak var view1: BoxView!
    @IBOutlet weak var view2: BoxView!
    @IBOutlet weak var view3: BoxView!
    @IBOutlet weak var view4: BoxView!
    @IBOutlet weak var view5: BoxView!
    @IBOutlet weak var view6: BoxView!
    
    
    var dataReward: [DataReward] = [
        DataReward(imageName: "Box1", stateReward: StateReward.open),
        DataReward(imageName: "Box1", stateReward: StateReward.countDown),
        DataReward(imageName: "Box4", stateReward: StateReward.wait),
        DataReward(imageName: "Box2", stateReward: StateReward.wait),
        DataReward(imageName: "Box3", stateReward: StateReward.wait),
        DataReward(imageName: "Box5", stateReward: StateReward.wait)
    ]
    
    var timer: Timer?
    var totalTime = 5
    var indexCoutdown = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        containView.layer.cornerRadius = 20
        containView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        oneButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: oneButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        botImage2.isHidden = true
        viewReward.isHidden = false
        indexCountDown()
        timerCountDown()
        setupView()
    }

    @IBAction func rewardAction(_ sender: Any) {
        botImage1.isHidden = false
        botImage2.isHidden = true
        viewReward.isHidden = false
        oneButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 178, height: 23), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        twoButton.setTitleColor(.lightGray, for: .normal)
    }
    
    @IBAction func taskAction(_ sender: Any) {
        botImage1.isHidden = true
        botImage2.isHidden = false
        viewReward.isHidden = true
        twoButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 148, height: 23), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        oneButton.setTitleColor(.lightGray, for: .normal)
    }
    func indexCountDown() {
        for i in 0..<dataReward.count {
            if dataReward[i].stateReward == StateReward.countDown {
                indexCoutdown = i
            }
        }
    }
    func timerCountDown() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.totalTime -= 1
            if self?.totalTime == -1 {
                self?.changeCountdown()
            } else if let totalTime = self?.totalTime {
                switch self?.indexCoutdown {
                case 0:
                    self?.view1.countDown(value: totalTime)
                case 1:
                    self?.view2.countDown(value: totalTime)
                case 2:
                    self?.view3.countDown(value: totalTime)
                case 3:
                    self?.view4.countDown(value: totalTime)
                case 4:
                    self?.view5.countDown(value: totalTime)
                case 5:
                    self?.view6.countDown(value: totalTime)
                default:
                    break
                }
            }
        }
    }
    func changeCountdown() {
        
        dataReward[indexCoutdown].stateReward = StateReward.open
        if indexCoutdown < 5 {
            totalTime = 5
            dataReward[indexCoutdown + 1].stateReward = StateReward.countDown
            indexCoutdown += 1
        } else {
            indexCoutdown = 0
            self.timer?.invalidate()
        }
        indexCountDown()
        setupView()
    }
    
    func setupView() {
        view1.setupView(data: dataReward[0])
        let tapBox1 = UITapGestureRecognizer(target: self, action: #selector(tapOpenBox1))
        view1.viewOpen.addGestureRecognizer(tapBox1)
        view2.setupView(data: dataReward[1])
        let tapBox2 = UITapGestureRecognizer(target: self, action: #selector(tapOpenBox2))
        view2.viewOpen.addGestureRecognizer(tapBox2)
        view3.setupView(data: dataReward[2])
        let tapBox3 = UITapGestureRecognizer(target: self, action: #selector(tapOpenBox3))
        view3.viewOpen.addGestureRecognizer(tapBox3)
        view4.setupView(data: dataReward[3])
        let tapBox4 = UITapGestureRecognizer(target: self, action: #selector(tapOpenBox4))
        view4.viewOpen.addGestureRecognizer(tapBox4)
        view5.setupView(data: dataReward[4])
        let tapBox5 = UITapGestureRecognizer(target: self, action: #selector(tapOpenBox5))
        view5.viewOpen.addGestureRecognizer(tapBox5)
        view6.setupView(data: dataReward[5])
        let tapBox6 = UITapGestureRecognizer(target: self, action: #selector(tapOpenBox6))
        view6.viewOpen.addGestureRecognizer(tapBox6)
    }
    
    @objc private func tapOpenBox1() {
        view1.imageView.image = UIImage(named: "Rose")
        view1.viewOpen.isHidden = true
        view1.viewFlower.isHidden = false
    }
    @objc private func tapOpenBox2() {
        view2.imageView.image = UIImage(named: "Rose")
        view2.viewOpen.isHidden = true
        view2.viewFlower.isHidden = false
    }
    @objc private func tapOpenBox3() {
        view3.imageView.image = UIImage(named: "Rose")
        view3.viewOpen.isHidden = true
        view3.viewFlower.isHidden = false
    }
    @objc private func tapOpenBox4() {
        view4.imageView.image = UIImage(named: "Rose")
        view4.viewOpen.isHidden = true
        view4.viewFlower.isHidden = false
    }
    @objc private func tapOpenBox5() {
        view5.imageView.image = UIImage(named: "Rose")
        view5.viewOpen.isHidden = true
        view5.viewFlower.isHidden = false
    }
    @objc private func tapOpenBox6() {
        view6.imageView.image = UIImage(named: "Rose")
        view6.viewOpen.isHidden = true
        view6.viewFlower.isHidden = false
    }
}
