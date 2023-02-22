//
//  HistoryTableViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 21/02/2023.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var dayCashOutLabel: UILabel!
    @IBOutlet weak var hourCashOutLabel: UILabel!
    @IBOutlet weak var resultCashOutLabel: UILabel!
    
    @IBOutlet weak var numberRubyLabel: UILabel!
    @IBOutlet weak var numberAccountLabel: UILabel!
    @IBOutlet weak var numberTransactionLabel: UILabel!
    
    // Chỉnh màu selection
    override func setSelected(_ selected: Bool, animated: Bool) {
        self.backgroundColor = .clear
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        resultCashOutLabel.clipsToBounds = true
        resultCashOutLabel.layer.cornerRadius = 4
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // Thêm khoảng cách giữa các cell
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20
    }
    
    func bindData(data: DataCashOut) {
        dayCashOutLabel.text = data.dayCashOut
        hourCashOutLabel.text = data.hourCashOut
        resultCashOutLabel.text = data.resultCashOut
        resultCashOutLabel.textColor = data.resultTextColor
        resultCashOutLabel.backgroundColor = data.resultBackgroundColor
        numberRubyLabel.text = data.numberRuby
        numberAccountLabel.text = data.numberAccount
        numberTransactionLabel.text = data.numberTransaction
    }
    
}
