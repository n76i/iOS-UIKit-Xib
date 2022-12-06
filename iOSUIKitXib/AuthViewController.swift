//
//  AuthViewController.swift
//  iOSUIKitXib
//
//  Created by Nguyen Cuong on 06/12/2022.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
