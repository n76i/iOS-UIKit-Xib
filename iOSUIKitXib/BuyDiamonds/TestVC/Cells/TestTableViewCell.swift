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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
