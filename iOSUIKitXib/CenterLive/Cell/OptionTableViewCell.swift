//
//  OptionTableViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/02/2023.
//

import UIKit

class OptionTableViewCell: UITableViewCell {

    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindData(data: DataManager) {
        showImage.image = UIImage(named: data.showImage)
        titleLabel.text = data.nameTitleLabel
        nextImage.image = UIImage(named: data.nextImage)
    }
}
