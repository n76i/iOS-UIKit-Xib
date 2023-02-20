//
//  TopDedicationTableViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 20/02/2023.
//

import UIKit

class TopDedicationTableViewCell: UITableViewCell {

    @IBOutlet weak var topRankingImage: UIImageView!
    @IBOutlet weak var topRankingLabel: UILabel!
    @IBOutlet weak var numberHeartLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func bindData(data: DataRanking) {
        topRankingImage.image = UIImage(named: data.topRankingImage)
        topRankingLabel.text = data.topRankingLabel
        numberHeartLabel.text = data.numberHeart
        topRankingLabel.isHidden = data.ishiddenRanking
    }
    
}
