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
    // disable view 1
    @IBOutlet var vBoxs: [BoxView]!
    // 25 = 5 * 5
    private var maxCouting = 25
    private var step = 0
    private var count = 5
    
    var dataReward: [DataReward] = [
        DataReward(imageName: "Box1", stateReward: StateReward.open),
        DataReward(imageName: "Box1", stateReward: StateReward.countDown),
        DataReward(imageName: "Box4", stateReward: StateReward.wait),
        DataReward(imageName: "Box2", stateReward: StateReward.wait),
        DataReward(imageName: "Box3", stateReward: StateReward.wait),
        DataReward(imageName: "Box5", stateReward: StateReward.wait)
    ]
    
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        containView.layer.cornerRadius = 20
        containView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        oneButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: oneButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        botImage2.isHidden = true
        viewReward.isHidden = false
        setupView()
        setTimer()
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
    func setTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [unowned self] timer in
            
            if maxCouting == 0 {
                timer.invalidate()
                self.timer = nil
                return
            }
//            print("ITEM \(maxCouting % 5)")
            if maxCouting % 5 == 0 {
                self.vBoxs[step].startAnimation(seconds: 5)
                self.step += 1
//                print("step= = \(step)")
            }
            self.maxCouting -= 1
            self.count -= 1
            self.vBoxs[step - 1].countDown(value: count)
            if count == 0 {
                count = 5
            }
//            print("Count \(count)")
            print(maxCouting)
            if maxCouting == 20 {
              updateView(index: 0, image: "Box1")
            } else if maxCouting == 15 {
                updateView(index: 1, image: "Box4")
            } else if maxCouting == 10 {
               updateView(index: 2, image: "Box2")
            } else if maxCouting == 5 {
               updateView(index: 3, image: "Box3")
            } else if maxCouting == 0 {
                updateView(index: 4, image: "Box5")
            }
        })
    }
    func setupView() {
        view1.setupView(data: dataReward[0])
        view1.tapView()
        vBoxs[0].setupView(data: dataReward[1])
        vBoxs[1].setupView(data: dataReward[2])
        vBoxs[2].setupView(data: dataReward[3])
        vBoxs[3].setupView(data: dataReward[4])
        vBoxs[4].setupView(data: dataReward[5])
    }
    func updateView(index: Int, image: String) {
        self.vBoxs[index].openBox(image: image)
        self.vBoxs[index].shapeView.isHidden = true
        self.vBoxs[index].tapView()
    }
}
