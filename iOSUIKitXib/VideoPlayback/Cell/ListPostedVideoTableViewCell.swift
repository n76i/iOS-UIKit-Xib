//
//  ListPostedVideoTableViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/02/2023.
//

import UIKit

class ListPostedVideoTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var imagePosted: UIImageView!
    @IBOutlet weak var titleLabelPosted: UILabel!
    @IBOutlet weak var deleteButton: UIButton?
    
    @IBOutlet weak var editButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
//        deleteButton.layer.cornerRadius = 4
        editButton.layer.cornerRadius = 4
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // Thêm khoảng cách giữa các cell
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    

    @IBAction func actionDelete(_ sender: Any) {
        callBack?(.delete)
    }
    
    @IBAction func actionEditButton(_ sender: Any) {
        callBack?(.edit)
    }
    
    func bindData(data: DataVideo) {
        self.imagePosted.image = UIImage(named: data.nameImage)
        self.titleLabelPosted.text = data.titleString
    }
    
}
