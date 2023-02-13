//
//  EditVideoViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 13/02/2023.
//

import UIKit

protocol PassDataDelegate: AnyObject {
    func passData(image: String, title: String, index: Int)
}

class EditVideoViewController: UIViewController {

    @IBOutlet weak var imageEdit: UIImageView!
    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var viewEditObject: UIView!
    
    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var numberOfCharLabel: UILabel!
    
    weak var delegate: PassDataDelegate?
    
    var index: Int = 0
    var content: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Chỉnh sửa"
        titleTextView.text = content
        
        let saveRightBarbutton = UIBarButtonItem(title: "Lưu", style: .plain, target: self, action: #selector(saveEdit))
        navigationItem.rightBarButtonItem = saveRightBarbutton
        saveRightBarbutton.tintColor = UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 30, height: 23), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!]))
        
        viewTitle.layer.cornerRadius = 8
        viewEditObject.layer.cornerRadius = 8
        
        self.numberOfCharLabel.text = "\(titleTextView.text.count)/200"
        
        titleTextView.delegate = self
    }
    @objc func saveEdit() {
        delegate?.passData(image: "7", title: titleTextView.text, index: index)
        navigationController?.popViewController(animated: true)
    }
}
extension EditVideoViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        let currentText = textView.text.count
        let textString = text.count
        let number = currentText + textString
        self.numberOfCharLabel.text = "\(number)/200"
        return number < 200
    }
    
}
