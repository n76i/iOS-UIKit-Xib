//
//  buyDiamondCollectionViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 16/01/2023.
//

import UIKit

class buyDiamondCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var numberDiamondLabel: UILabel!
    @IBOutlet weak var vndLabel: UILabel!
    @IBOutlet weak var saleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customView.layer.cornerRadius = 8
       
    }
    func bindData(diamond: Diamond) {
        vndLabel.text = diamond.vndPrice
        numberDiamondLabel.text = diamond.numberDiamond
        saleImage.isHidden = diamond.sale
    }

}
