//
//  ViewController.swift
//  iOSUIKitXib
//
//  Created by Nguyen Cuong on 06/12/2022.
//

import UIKit

@available(iOS 13.0, *)
class ViewController: UIViewController {
    
    @IBOutlet weak var testVcButton: UIButton!
    @IBOutlet weak var tableVCButton: UIButton!
    @IBOutlet weak var collectionButton: UIButton!
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var buyDiamondButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Home"
        testVcButton.layer.cornerRadius = 30
        testVcButton.layer.borderWidth = 3
        
        tableVCButton.layer.cornerRadius = 30
        tableVCButton.layer.borderWidth = 3
        
        collectionButton.layer.cornerRadius = 30
        collectionButton.layer.borderWidth = 3
        
        customButton.layer.cornerRadius = 50
        customButton.layer.borderWidth = 3
        
        buyDiamondButton.layer.cornerRadius = 30
        buyDiamondButton.layer.borderWidth = 3
    }


    @IBAction func buttonDidTap(_ sender: Any) {
        let viewController = TestViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func buttonTable(_ sender: Any) {
        let viewController = TableViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func buttonCollection(_ sender: Any) {
        let viewController = CollectionViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func buttonCustom(_ sender: Any) {
        let viewController = CustomCollecVsTableViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func buttonDiamond(_ sender: Any) {
        let viewController = BuyDiamondsVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func buttonWalletDiamond(_ sender: UIButton) {
        let viewController = WalletDiamondsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

