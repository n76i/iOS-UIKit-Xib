//
//  ListSettingTableViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 09/02/2023.
//

import UIKit

class ListSettingTableViewCell: UITableViewCell {

    // var dataManager = [DataManager]()
    
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var nextImage: UIImageView!
    @IBOutlet weak var notifyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }
    func bindData(dataManager: DataManager) {
        showImage.image = UIImage(named: dataManager.showImage)
        nameTitleLabel.text = dataManager.nameTitleLabel
        nextImage.image = UIImage(named: dataManager.nextImage)
        notifyImage.image = UIImage(named: dataManager.notifyImage)
        notifyImage.isHidden = dataManager.isHiden
    }
    
}
