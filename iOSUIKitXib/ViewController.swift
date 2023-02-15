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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
//        title = "Home"
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.tintColor = .black
        
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
//        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "aa")
        tableView.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: "bb")
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


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bb", for: indexPath) as? Cell
        cell?.updateDisplay(title: yumiData(index: indexPath.row), des: yumiData(index: indexPath.row))
        return cell!
    }
}
func yumiData(index: Int) -> String{
    var curretn:String = ""
    
    for _ in 0...index {
        curretn += UUID().uuidString
    }
    return curretn
}
