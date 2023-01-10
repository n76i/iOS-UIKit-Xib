//
//  MyCollectionViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/01/2023.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with model: Models) {
        self.myLabel.text = model.text
        self.myImageView.image = UIImage(named: model.imageName)
        self.myImageView.contentMode = .scaleAspectFill
    }

}
