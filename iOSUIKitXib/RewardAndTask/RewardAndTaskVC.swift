//
//  RewardAndTaskVC.swift
//  iOSUIKitXib
//
//  Created by HungND on 30/12/2022.
//

import UIKit

class RewardAndTaskVC: UIViewController {
    
    @IBOutlet weak var spaceView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var rewardTitleLabel: UILabel!
    
    @IBOutlet weak var lineViewReward: UIView!
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet weak var taskTab: UIView!
    @IBOutlet weak var rewardTab: UIView!
    @IBOutlet weak var lineViewTask: LineView!
    @IBOutlet weak var sheetView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        lineViewTask.isHidden = true
        
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0)
        spaceView.backgroundColor = UIColor.black.withAlphaComponent(0)
        sheetView.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        spaceView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.spaceAction(_:)))
        )
        
        rewardTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.rewardTabAct(_:)))
        )
        
        taskTab.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.taskTabAct(_:)))
        )
        sheetView.roundCorners([.topLeft, .topRight], radius: 18)
        
        rewardTitleLabel.gradientColorText(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])
        taskTitleLabel.gradientColorText(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])
    }
    
    @objc func spaceAction(_ sender:UITapGestureRecognizer){
        // do other task
        dismiss(animated: true)
    }
    
    @objc func rewardTabAct(_ sender:UITapGestureRecognizer) {
        lineViewTask.isHidden = true
        lineViewReward.isHidden = false

        contentView.subviews.forEach({$0.removeFromSuperview()})
        
        let rewardTab = RewardView()
        
        contentView.addSubview(rewardTab)
        rewardTab.frame = contentView.bounds
    }
    
    @objc func taskTabAct(_ sender:UITapGestureRecognizer) {
        lineViewTask.isHidden = false
        lineViewReward.isHidden = true
        
        
        contentView.subviews.forEach({$0.removeFromSuperview()})

        let vc = UIView()
        vc.backgroundColor = .red
        
        contentView.addSubview(vc)
        vc.frame = contentView.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {

        lineViewTask.isHidden = true
        lineViewReward.isHidden = false

        let rewardTab = RewardView()
        
        contentView.addSubview(rewardTab)
        rewardTab.frame = contentView.bounds
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

