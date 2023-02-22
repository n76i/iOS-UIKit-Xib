//
//  ChartsViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 20/02/2023.
//

import UIKit

@available(iOS 15.0, *)
class RankingViewController: UIViewController {

    @IBOutlet weak var viewShowbottomSheet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapVC))
        viewShowbottomSheet.addGestureRecognizer(tap)
    }
    @objc func tapVC() {
        let vc = SheetViewController()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        present(vc, animated: true)
    }
}

