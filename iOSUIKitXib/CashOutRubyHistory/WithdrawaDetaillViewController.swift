//
//  WithdrawaDetaillViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 22/02/2023.
//

import UIKit

class WithdrawaDetaillViewController: UIViewController {
    
    @IBOutlet weak var trainslationCodeLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var numberRubyLabel: UILabel!
    @IBOutlet weak var numberAccountLabel: UILabel!
    @IBOutlet weak var resultCashOutLabel: UILabel!
    
    @IBOutlet weak var wrongAccountLabel: UILabel!
    @IBOutlet weak var swapImageLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var imageLabel: UILabel!
    
    var index = 0
    var trainslationCode = ""
    var hourMinute = ""
    var day = ""
    var numberRuby = ""
    var numberAccount = ""
    var result = ""
    var resultTextColor = UIColor()
    var resultBackground = UIColor()
    
    var wrongAccount = ""
    var sawpImage = ""
    var resaon = ""
    var imageL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chi tiết rút tiền"
        
        trainslationCodeLabel.text = trainslationCode
        hourLabel.text = hourMinute
        dayLabel.text = day
        numberRubyLabel.text = numberRuby
        numberAccountLabel.text = numberAccount
        resultCashOutLabel.text = result
        resultCashOutLabel.textColor = resultTextColor
        resultCashOutLabel.backgroundColor = resultBackground
        wrongAccountLabel.text = wrongAccount
        swapImageLabel.text = sawpImage
        reasonLabel.text = resaon
        imageLabel.text = imageL
        
        resultCashOutLabel.layer.cornerRadius = 4
    }

}
