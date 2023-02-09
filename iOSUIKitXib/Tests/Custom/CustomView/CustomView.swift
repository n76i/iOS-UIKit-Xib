//
//  File.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 12/01/2023.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var myLabelText: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    var arrImage: [String] = ["Arhi", "Akali", "Irelia", "Aine", "Atroc", "Veocoz", "Azhi", "BlitcBlank"]
    var index = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        Bundle.main.loadNibNamed("CustomView", owner: self)
        self.addSubview(containView)
        containView.frame = self.bounds
        containView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        myLabelText.font = .systemFont(ofSize: 20)
        myImage.contentMode = .scaleAspectFill
        myImage.layer.cornerRadius = 100
        myImage.image = UIImage(named: "Arhi")
        myLabelText.text = arrImage[0]
    }
    
    @IBAction func nextActionButton(_ sender: UIButton) {
        index += 1
        if index == arrImage.count {
            index = 0
        }
        myImage.image = UIImage(named: arrImage[index])
        myLabelText.text = arrImage[index]
    }
    @IBAction func backActionButton(_ sender: UIButton) {
        index -= 1
        if index < 0 {
            index = arrImage.count-1
        }
        myImage.image = UIImage(named: arrImage[index])
        myLabelText.text = arrImage[index]
    }
    
}
