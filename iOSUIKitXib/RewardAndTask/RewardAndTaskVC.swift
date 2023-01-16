//
//  RewardAndTaskVC.swift
//  iOSUIKitXib
//
//  Created by HungND on 30/12/2022.
//

import UIKit

class RewardAndTaskVC: UIViewController {
    
    
    @IBOutlet weak var spaceBottomContentView: NSLayoutConstraint!
    @IBOutlet weak var space: UIView!
    @IBOutlet weak var heightConstrainSheetView: NSLayoutConstraint!
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
    
    let heightScreen = UIScreen.main.bounds.height
    let widthScreen = UIScreen.main.bounds.width

    func setupView() {
        lineViewTask.isHidden = true
        
        self.view.backgroundColor = UIColor(named: "F8F8F6")
        space.backgroundColor = UIColor.white.withAlphaComponent(0)
        sheetView.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        if(hasTopNotch) {
            self.heightConstrainSheetView.constant = self.heightScreen * 0.4
        } else {
            self.heightConstrainSheetView.constant = self.heightScreen * 0.5
        }
        
        space.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.spaceAction(_:)))
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
        
        UIView.animate(withDuration: 1, animations: {
            if(self.hasTopNotch) {
                self.heightConstrainSheetView.constant = self.heightScreen * 0.4
            } else {
                self.heightConstrainSheetView.constant = self.heightScreen * 0.5
            }
            
            self.sheetView.frame.size = CGSize(width: self.widthScreen, height: self.heightScreen)
            
            self.view.layoutIfNeeded()
        })
        
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
        UIView.animate(withDuration: 1, animations: {
            self.heightConstrainSheetView.constant = 100
            self.sheetView.frame.size = CGSize(width: self.widthScreen, height: self.heightScreen)
            self.view.layoutIfNeeded()
            
        })

    }
    
    override func viewDidAppear(_ animated: Bool) {

        lineViewTask.isHidden = true
        lineViewReward.isHidden = false

        let rewardTab = RewardView()
        
        contentView.addSubview(rewardTab)
        rewardTab.frame = contentView.bounds
    }
    
    var hasTopNotch: Bool {
        if #available(iOS 13.0,  *) {
            return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
        }else{
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
    }
}

