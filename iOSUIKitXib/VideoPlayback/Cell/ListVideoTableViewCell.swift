//
//  ListVideoTableViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/02/2023.
//

import UIKit

class ListVideoTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var titleLabelRecord: UILabel!
    
    @IBOutlet weak var deleteVideoButton: UIButton!
    
    @IBOutlet weak var postVideoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        deleteVideoButton.layer.cornerRadius = 4
        postVideoButton.layer.cornerRadius = 4
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        // Thêm khoảng cách giữa các cell
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    @IBAction func actionDelete(_ sender: Any) {
        callBack?(.delete)
    }
    func bindData(data: DataVideo) {
        self.videoImage.image = UIImage(named: data.nameImage)
        self.titleLabelRecord.text = data.titleString
    }
}
