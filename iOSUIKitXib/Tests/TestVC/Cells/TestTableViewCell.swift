//
//  TestTableViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 09/01/2023.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    // có xib thì dùng awakeFromBib
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func configure(models: Models) {
        self.myLabel.text = models.text
        self.myImage.image = UIImage(named: models.imageName)
    }
    
}
